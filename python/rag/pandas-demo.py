import pandas as pd

# 1. 读取 CSV
df = pd.read_csv("wukong2.csv")
print("原始数据：")
print(df)

# 2. 查看数据基本情况
print("\n数据概览：")
print(df.info())   # 数据类型、缺失情况
print("\n前几行数据：")
print(df.head())

# 3. 访问列
print("\n用户列：")
print(df["用户"])

print("\n游戏时长列：")
print(df["大圣游戏时长"])

# 4. 筛选数据
推荐评论 = df[df["是否推荐"] == "推荐"]
print("\n筛选出推荐的评论：")
print(推荐评论)

# 5. 条件筛选：游戏时长 > 12 小时
长时玩家 = df[df["大圣游戏时长"] > 12]
print("\n游戏时长 > 12 小时的评论：")
print(长时玩家)

# 6. 新增列：长时玩家
df["是否长时玩家"] = df["大圣游戏时长"] >= 12
print("\n新增列 '是否长时玩家'：")
print(df)

# 7. 统计信息
print("\n平均游戏时长：", df["大圣游戏时长"].mean())
print("推荐与不推荐数量统计：")
print(df["是否推荐"].value_counts())

# 8. 保存新文件
df.to_csv("wukong_processed.csv", index=False, encoding="utf-8-sig")
print("\n处理后的数据已保存为 wukong_processed.csv")
