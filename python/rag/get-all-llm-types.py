"""
本文件演示了四种调用大模型（Qwen）的方法：
1. HTTP Requests (最底层)
2. 通用SDK (OpenAI SDK + 兼容模式)
3. 官方SDK (DashScope SDK)
4. LangChain (高级框架)

请在运行前安装依赖：
pip install requests openai dashscope langchain_community

并替换 YOUR_API_KEY_HERE 为您自己的阿里云百炼API Key。
"""

import requests  # 用于发送HTTP请求
import json      # 用于处理JSON数据的序列化和反序列化
import os        # 用于操作系统相关的功能，如设置环境变量
from openai import OpenAI  # 从openai库导入OpenAI客户端
import dashscope             # 导入dashscope库
from dashscope import Generation  # 从dashscope中导入核心的Generation类
from langchain_community.chat_models import ChatTongyi  # 从langchain_community导入与通义千问交互的模型类
from langchain_core.messages import HumanMessage  # 从langchain_core导入消息对象

# ==================== 全局配置 ====================
# ⚠️ 请务必替换为您的真实API Key
API_KEY = "sk-00169551629145bf9f53a50fb67cd65b"  # 替换为您的API Key
MODEL_NAME = "qwen-plus"  # 您可以选择 qwen-turbo, qwen-max 等
USER_QUESTION = "你好，请做个简单的自我介绍。"
# ==================================================

def method_1_http_request():
    print("\n" + "="*50) # 打印分隔线
    print("方法1: HTTP Requests")
    print("="*50)
    
    # 1. 定义API端点和请求头
    url = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions"  # API的URL地址
    headers = { # HTTP请求头
        "Authorization": f"Bearer {API_KEY}", # 鉴权头，将API Key放入
        "Content-Type": "application/json"    # 告诉服务器，我们发送的是JSON格式的数据
    }
    
    # 2. 构建请求体 (Payload)
    payload = {
        "model": MODEL_NAME, # 指定模型
        "messages": [ # 对话历史，是一个消息列表
            {"role": "user", "content": USER_QUESTION} # 用户角色，内容是我们的提问
        ]
    }
    
    # 3. 发送POST请求
    try:
        # 发送POST请求，data参数需要是JSON字符串，所以用json.dumps()转换
        response = requests.post(url, headers=headers, data=json.dumps(payload))
        response.raise_for_status()  # 如果HTTP状态码不是2xx，会抛出异常
        
        # 4. 解析响应
        result = response.json() # 将返回的JSON字符串解析为Python字典
        # 从字典中按层级提取内容：
        # result["choices"] -> 获取选择列表
        # [0] -> 取第一个（也是唯一一个）选择
        # ["message"] -> 获取该选择中的消息对象
        # ["content"] -> 获取消息的实际文本内容
        answer = result["choices"][0]["message"]["content"]
        print(f"回答: {answer}")
    except Exception as e:
        print(f"HTTP请求失败: {e}")
def method_2_generic_sdk():
    """方法2: 使用通用SDK (OpenAI SDK)"""
    print("\n" + "="*50)
    print("方法2: 通用SDK (OpenAI SDK)")
    print("="*50)
    
    # 1. 初始化客户端
    # 创建一个OpenAI客户端实例，指定了百炼的base_url和您的API Key
    client = OpenAI(
        api_key=API_KEY,
        base_url="https://dashscope.aliyuncs.com/compatible-mode/v1" # 指向百炼的OpenAI兼容接口
    )
    
    # 2. 发送请求
    try:
        # 使用client对象的chat.completions.create方法发送请求。
        # 这个方法会自动处理底层的HTTP请求、JSON序列化等。
        completion = client.chat.completions.create(
            model=MODEL_NAME,
            messages=[
                {"role": "user", "content": USER_QUESTION}
            ]
        )
        # 3. 获取结果
        # `completion` 是一个对象。我们通过属性访问来获取内容。
        # `completion.choices` 是一个列表
        # `[0]` 取第一个元素
        # `.message` 是该选择的消息对象
        # `.content` 是消息的文本内容 (注意：这里是属性，不是字典键)
        answer = completion.choices[0].message.content
        print(f"回答: {answer}")
    except Exception as e:
        print(f"SDK调用失败: {e}")

def method_3_official_sdk():
    """方法3: 使用官方SDK (DashScope SDK)"""
    print("\n" + "="*50)
    print("方法3: 官方SDK (DashScope SDK)")
    print("="*50)
    
    # 1. 设置API密钥
    # 这是官方SDK特有的方式，需要先全局设置API Key
    dashscope.api_key = API_KEY
    
    # 2. 调用模型
    try:
        # 调用Generation.call静态方法。
        # 注意：这里使用的是'role'和'content'，是字典格式。
        response = Generation.call(
            model=MODEL_NAME,
            messages=[
                {'role': 'user', 'content': USER_QUESTION}
            ]
        )
        
        # 3. 检查并获取结果
        # 首先检查HTTP状态码
        if response.status_code == 200:
            # 如果成功，从response.output中提取。
            # `response.output.choices` 是一个列表
            # `[0]` 取第一个
            # `['message']` 是字典
            # `['content']` 是最终的文本
            answer = response.output.choices[0]['message']['content']
            print(f"回答: {answer}")
        else:
            # 如果API调用本身失败（如鉴权错误），打印错误码和信息
            print(f"API调用失败: {response.code}, {response.message}")
    except Exception as e:
        print(f"SDK调用失败: {e}")
def method_4_langchain():
    """方法4: 使用LangChain框架"""
    print("\n" + "="*50)
    print("方法4: LangChain")
    print("="*50)
    
    # 1. 初始化LangChain的聊天模型
    # LangChain约定使用环境变量DASHSCOPE_API_KEY
    os.environ["DASHSCOPE_API_KEY"] = API_KEY
    # 创建一个ChatTongyi实例，指定模型名称
    llm = ChatTongyi(model_name=MODEL_NAME)
    
    # 2. 准备消息
    # 使用LangChain定义的HumanMessage对象来包装用户消息
    messages = [HumanMessage(content=USER_QUESTION)]
    
    # 3. 调用.invoke()方法
    try:
        # 调用.invoke()方法，传入消息列表。
        # 这是LangChain的标准接口。
        response = llm.invoke(messages)
        # 4. 获取结果
        # LangChain的invoke()返回一个AIMessage对象。
        # 我们通过其.content属性获取文本。
        answer = response.content
        print(f"回答: {answer}")
    except Exception as e:
        print(f"LangChain调用失败: {e}")


# ==================== 主函数 ====================
if __name__ == "__main__":
    # 只有当此脚本被直接运行时，才执行以下代码
    print(f"正在使用模型: {MODEL_NAME}")
    print(f"问题: {USER_QUESTION}")
    
    # 依次调用四种方法
    method_1_http_request()
    method_2_generic_sdk()
    method_3_official_sdk()
    method_4_langchain()
    
    print("\n" + "="*50)
    print("演示结束。")
    print("="*50)