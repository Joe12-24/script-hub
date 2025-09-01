from playwright.sync_api import sync_playwright   # ✅ 正确导入

import time
from datetime import datetime
import re

def extract_phone_number(input_str):
    """从WhatsApp的联系人ID中提取电话号码"""
    # WhatsApp的ID格式通常是 电话号码@c.us 或 群组ID@g.us
    match = re.match(r'^(\+?\d+)@', input_str)
    if match:
        return match.group(1)
    return input_str

def format_message(msg):
    """格式化消息内容以便于阅读"""
    try:
        # 提取基本信息
        sender = extract_phone_number(msg.get('from', '未知发送者'))
        receiver = extract_phone_number(msg.get('to', '未知接收者'))
        timestamp = datetime.fromtimestamp(msg.get('timestamp', time.time())).strftime('%Y-%m-%d %H:%M:%S')
        
        # 处理不同类型的消息
        msg_type = msg.get('type', 'unknown')
        if msg_type == 'text':
            content = msg.get('text', {}).get('body', '无内容')
        elif msg_type in ['image', 'video', 'audio', 'document']:
            content = f"[{msg_type.upper()}消息] 文件名: {msg.get(msg_type, {}).get('filename', '未知')}"
        else:
            content = f"[未处理的消息类型: {msg_type}]"
            
        return f"[{timestamp}] {sender} → {receiver}: {content}"
    except Exception as e:
        return f"解析消息出错: {str(e)}"

def run_demo():
    print("=== WhatsApp消息抓取演示程序 ===")
    print("程序将启动浏览器并打开WhatsApp Web")
    print("请使用手机WhatsApp扫描屏幕上的二维码进行登录")
    
    with sync_playwright() as p:
        # 启动浏览器（非无头模式，方便扫码）
        browser = p.chromium.launch(headless=False)
        page = browser.new_page()
        
        # 导航到WhatsApp Web
        page.goto("https://web.whatsapp.com")
        print("请在30秒内完成扫码登录...")
        
        # 等待登录完成（通过检测左侧聊天列表是否加载）
        try:
            page.wait_for_selector('div[role="tree"]', timeout=50000)
            print("登录成功，开始监听消息...")
            print("----------------------------------------")
        except:
            print("登录超时或失败")
            browser.close()
            return
        
        # 监听网络响应，提取消息
        def handle_response(response):
            # 筛选可能包含消息的API响应
            if "web.whatsapp.com" in response.url and "/api/" in response.url:
                try:
                    # 尝试解析JSON响应
                    data = response.json()
                    # 检查是否包含消息数据
                    if isinstance(data, dict) and "messages" in data:
                        for msg in data["messages"]:
                            # 格式化并打印消息
                            formatted = format_message(msg)
                            print(formatted)
                except:
                    # 忽略解析错误，继续监听
                    pass
        
        # 注册响应处理函数
        page.on("response", handle_response)
        
        # 保持程序运行
        try:
            while True:
                time.sleep(1)
        except KeyboardInterrupt:
            print("\n程序已停止")
            browser.close()

if __name__ == "__main__":
    try:
        # 运行演示程序
        run_demo()
    except Exception as e:
        print(f"程序出错: {str(e)}")
