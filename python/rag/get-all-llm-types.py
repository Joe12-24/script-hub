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

import requests
import json
import os
from openai import OpenAI
import dashscope
from dashscope import Generation
from langchain_community.chat_models import ChatTongyi
from langchain_core.messages import HumanMessage

# ==================== 全局配置 ====================
# ⚠️ 请务必替换为您的真实API Key
API_KEY = "sk-00169551629145bf9f53a50fb67cd65b"  # 替换为您的API Key
MODEL_NAME = "qwen-plus"  # 您可以选择 qwen-turbo, qwen-max 等
USER_QUESTION = "你好，请做个简单的自我介绍。"
# ==================================================

def method_1_http_request():
    """方法1: 使用HTTP Requests直接调用"""
    print("\n" + "="*50)
    print("方法1: HTTP Requests")
    print("="*50)
    
    # 1. 定义API端点和请求头
    url = "https://dashscope.aliyuncs.com/compatible-mode/v1/chat/completions"
    headers = {
        "Authorization": f"Bearer {API_KEY}",
        "Content-Type": "application/json"
    }
    
    # 2. 构建请求体 (Payload)
    payload = {
        "model": MODEL_NAME,
        "messages": [
            {"role": "user", "content": USER_QUESTION}
        ]
    }
    
    # 3. 发送POST请求
    try:
        response = requests.post(url, headers=headers, data=json.dumps(payload))
        response.raise_for_status()  # 检查HTTP错误
        
        # 4. 解析响应
        result = response.json()
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
    client = OpenAI(
        api_key=API_KEY,
        base_url="https://dashscope.aliyuncs.com/compatible-mode/v1"
    )
    
    # 2. 发送请求
    try:
        completion = client.chat.completions.create(
            model=MODEL_NAME,
            messages=[
                {"role": "user", "content": USER_QUESTION}
            ]
        )
        # 3. 获取结果
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
    dashscope.api_key = API_KEY
    
    # 2. 调用模型
    try:
        response = Generation.call(
            model=MODEL_NAME,
            messages=[
                {'role': 'user', 'content': USER_QUESTION}
            ]
        )
        
        # 3. 检查并获取结果
        if response.status_code == 200:
            answer = response.output.choices[0]['message']['content']
            print(f"回答: {answer}")
        else:
            print(f"API调用失败: {response.code}, {response.message}")
    except Exception as e:
        print(f"SDK调用失败: {e}")

def method_4_langchain():
    """方法4: 使用LangChain框架"""
    print("\n" + "="*50)
    print("方法4: LangChain")
    print("="*50)
    
    # 1. 初始化LangChain的聊天模型
    # 注意: LangChain使用环境变量 DASHSCOPE_API_KEY
    os.environ["DASHSCOPE_API_KEY"] = API_KEY
    llm = ChatTongyi(model_name=MODEL_NAME)
    
    # 2. 准备消息
    messages = [HumanMessage(content=USER_QUESTION)]
    
    # 3. 调用.invoke()方法
    try:
        response = llm.invoke(messages)
        # 4. 获取结果
        answer = response.content
        print(f"回答: {answer}")
    except Exception as e:
        print(f"LangChain调用失败: {e}")

# ==================== 主函数 ====================
if __name__ == "__main__":
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