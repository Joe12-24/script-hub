import os
import time
import logging
from typing import List, Dict, Optional, Any
from openai import OpenAI, APIConnectionError, RateLimitError, APIStatusError
from tenacity import retry, stop_after_attempt, wait_exponential, retry_if_exception_type

# ==================== 配置日志 ====================
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)

class QwenAPIClient:
    """
    一个用于调用通义千问（Qwen）大模型的封装客户端。
    使用OpenAI SDK的兼容模式，便于未来迁移。
    
    特性:
    - 自动从环境变量读取API Key和Base URL
    - 内置重试机制 (tenacity)
    - Token消耗计算与日志记录
    - 支持深度思考 (Deep Thinking) 和联网搜索 (Web Search)
    - 可配置的超时和最大重试次数
    """
    
    def __init__(self, 
                 api_key: Optional[str] = None, 
                 base_url: Optional[str] = None,
                 timeout: float = 30.0,
                 max_retries: int = 3):
        """
        初始化客户端。
        
        Args:
            api_key: 百炼API Key。如果为None，则从环境变量 DASHSCOPE_API_KEY 读取。
            base_url: API的Base URL。如果为None，则从环境变量 DASHSCOPE_BASE_URL 读取，或使用默认值。
            timeout: 请求超时时间（秒）。
            max_retries: 最大重试次数。
        """
        # 获取API Key
        self.api_key = api_key or os.getenv("DASHSCOPE_API_KEY")
        if not self.api_key:
            raise ValueError("API Key未提供。请在初始化时传入或设置环境变量 DASHSCOPE_API_KEY。")
        
        # 获取Base URL
        self.base_url = base_url or os.getenv("DASHSCOPE_BASE_URL", "https://dashscope.aliyuncs.com/compatible-mode/v1")
        
        # 创建OpenAI客户端
        self.client = OpenAI(
            api_key=self.api_key,
            base_url=self.base_url,
            timeout=timeout
        )
        
        self.max_retries = max_retries
        logger.info("QwenAPIClient 初始化成功。")
    
    @retry(
        # 在遇到指定异常时进行重试
        retry=(retry_if_exception_type(APIConnectionError) | 
               retry_if_exception_type(RateLimitError)),
        # 指数退避等待：1s, 2s, 4s...
        wait=wait_exponential(multiplier=1, max=10),
        # 最多重试3次（加上首次调用，共4次尝试）
        stop=stop_after_attempt(3),
        # 记录重试日志
        reraise=True
    )
    def chat_completion(self,
                        messages: List[Dict[str, str]],
                        model: str = "qwen-plus",
                        temperature: float = 0.7,
                        max_tokens: Optional[int] = None,
                        enable_thinking: bool = False,
                        thinking_budget: Optional[int] = None,
                        enable_search: bool = False,
                        search_options: Optional[Dict[str, Any]] = None,
                        **kwargs) -> Dict[str, Any]:
        """
        发送聊天完成请求到Qwen模型。
        
        Args:
            messages: 对话消息列表，格式为 [{"role": "user", "content": "你好"}]。
            model: 要调用的模型名称。
            temperature: 生成文本的随机性。
            max_tokens: 生成的最大Token数。
            enable_thinking: 是否开启深度思考模式。
            thinking_budget: 思考过程的最大Token数，用于限制思考长度。
            enable_search: 是否开启联网搜索。
            search_options: 联网搜索的详细配置，如 {"search_strategy": "pro", "enable_citation": True}。
            **kwargs: 其他传递给client.chat.completions.create的参数。
        
        Returns:
            包含完整响应、输入/输出Token数的字典。
        
        Raises:
            APIStatusError: 当API返回非2xx状态码时抛出。
            ValueError: 当请求参数无效时抛出。
        """
        logger.info(f"正在调用模型: {model}")
        
        # 构建额外参数
        extra_params = {}
        
        # 添加深度思考参数
        if enable_thinking:
            extra_params["enable_thinking"] = True
            if thinking_budget is not None:
                extra_params["thinking_budget"] = thinking_budget
        
        # 添加联网搜索参数
        if enable_search:
            extra_params["enable_search"] = True
            if search_options:
                extra_params["search_options"] = search_options
        
        # 合并所有参数
        all_params = {
            "model": model,
            "messages": messages,
            "temperature": temperature,
            **extra_params,
            **kwargs
        }
        # 添加max_tokens（如果提供）
        if max_tokens is not None:
            all_params["max_tokens"] = max_tokens
        
        try:
            # 发送请求
            response = self.client.chat.completions.create(**all_params)
            
            # 计算Token消耗
            input_tokens = response.usage.prompt_tokens
            output_tokens = response.usage.completion_tokens
            total_tokens = response.usage.total_tokens
            
            # 提取回复内容
            # 注意：如果开启了流式传输(stream=True)，这里需要特殊处理。
            # 本方法默认为非流式。
            answer = response.choices[0].message.content
            
            # 记录日志
            logger.info(f"调用成功。输入Token: {input_tokens}, 输出Token: {output_tokens}, 总计: {total_tokens}")
            
            return {
                "success": True,
                "answer": answer,
                "raw_response": response, # 返回完整的响应对象，便于调试
                "usage": {
                    "input_tokens": input_tokens,
                    "output_tokens": output_tokens,
                    "total_tokens": total_tokens
                }
            }
            
        except APIStatusError as e:
            logger.error(f"API调用失败，状态码: {e.status_code}, 错误信息: {e.message}")
            return {
                "success": False,
                "answer": None,
                "error": f"API调用失败: {e.status_code} - {e.message}",
                "raw_response": None,
                "usage": {"input_tokens": 0, "output_tokens": 0, "total_tokens": 0}
            }
        except Exception as e:
            logger.error(f"发生未知错误: {type(e).__name__}: {e}")
            return {
                "success": False,
                "answer": None,
                "error": f"未知错误: {str(e)}",
                "raw_response": None,
                "usage": {"input_tokens": 0, "output_tokens": 0, "total_tokens": 0}
            }

# ==================== 使用示例 ====================
if __name__ == "__main__":
    # 1. 推荐方式：通过环境变量配置
    # 在运行脚本前，在命令行执行：
    # export DASHSCOPE_API_KEY="sk-你的密钥"
    # python qwen_api_client.py
    
    # 2. 或者，在代码中直接传入（不推荐用于生产，但方便测试）
    # client = QwenAPIClient(api_key="sk-00169551629145bf9f53a50fb67cd65b")
    
    # 使用环境变量的方式初始化
    client = QwenAPIClient()
    
    # 定义对话
    conversation = [
        {"role": "user", "content": "你好，请做个简单的自我介绍。"}
    ]
    
    # 调用API
    result = client.chat_completion(
        messages=conversation,
        model="qwen-plus",
        temperature=0.5
        # enable_thinking=True, # 如需开启深度思考
        # enable_search=True,    # 如需开启联网搜索
    )
    
    # 处理结果
    if result["success"]:
        print("模型的回答:")
        print(result["answer"])
        print(f"\nToken消耗: 输入 {result['usage']['input_tokens']}，输出 {result['usage']['output_tokens']}")
    else:
        print("调用失败:", result["error"])