import pandas as pd
from openai import OpenAI
import json
import time

# Qwen 客户端
client = OpenAI(
    api_key="sk-00169551629145bf9f53a50fb67cd65b",  # 直接填写你的 API 密钥
    base_url="https://dashscope.aliyuncs.com/compatible-mode/v1",
)

def analyze_comment(content, play_time, review_time, recommend_flag):
    """
    调用模型分析评论，返回推荐结果
    """
    prompt = f"""
    分析以下游戏评论是否推荐《黑神话：悟空》，只返回 JSON:
    评论内容: {content}
    游戏时长: {play_time}小时
    发布时间: {review_time}
    原推荐状态: {recommend_flag}
    JSON 格式: {{"recommend": true/false, "reason": "简要原因"}}
    """
    try:
        response = client.chat.completions.create(
            model="qwen-plus",
            messages=[
                {"role": "system", "content": "你是游戏评论分析助手，请只返回 JSON 格式。"},
                {"role": "user", "content": prompt},
            ],
            temperature=0.1,
            max_tokens=200,
        )
        raw_content = response.choices[0].message.content.strip()
        cleaned = raw_content.strip("`").replace("json", "").strip()
        return json.loads(cleaned)
    except Exception as e:
        print(f"模型分析异常: {e}")
        return {"recommend": None, "reason": "模型分析失败"}

def assign_label(row):
    """
    根据模型结果 + 规则打标签
    """
    model_result = row['模型推荐结果']
    
    # 优先模型结果
    if model_result and model_result.get('recommend') is True:
        return '推荐'
    elif model_result and model_result.get('recommend') is False:
        return '不推荐'
    
    # 模型无法判断时，结合原始推荐列
    if row['是否推荐'] == '推荐':
        return '推荐'
    elif row['是否推荐'] == '不推荐':
        return '不推荐'
    
    # 游戏时长极短且模型无结论 → 中立
    if row['大圣游戏时长'] < 1:
        return '中立'
    
    return '中立'

# 尝试多种编码读取 CSV
encodings_to_try = ['utf-8-sig', 'utf-8', 'gbk', 'cp936']
for enc in encodings_to_try:
    try:
        df = pd.read_csv("wukong2.csv", quotechar='"', encoding=enc)
        print(f"成功读取 CSV，使用编码: {enc}")
        break
    except Exception as e:
        print(f"使用编码 {enc} 失败: {e}")
else:
    raise ValueError("无法读取 CSV 文件，请检查编码或文件格式。")

# 新增列
df['模型推荐结果'] = None
df['标签'] = None

for idx, row in df.iterrows():
    result = analyze_comment(row['评论'], row['大圣游戏时长'], row['发布时间(2024年)'], row['是否推荐'])
    df.at[idx, '模型推荐结果'] = result
    df.at[idx, '标签'] = assign_label({'模型推荐结果': result,
                                       '是否推荐': row['是否推荐'],
                                       '大圣游戏时长': row['大圣游戏时长']})
    
    # 日志打印
    if (idx + 1) % 10 == 0:  # 每10行打印一次
        print(f"已处理 {idx + 1}/{len(df)} 条评论...")
    # 或者每条打印一次，可取消上面条件，直接 print(idx+1, result)

    time.sleep(1)  # 避免 API 限流

# 保存 CSV
df.to_csv("wukong_标签.csv", index=False, encoding='utf-8-sig')
print("分析完成，结果已保存到 wukong_标签.csv")
