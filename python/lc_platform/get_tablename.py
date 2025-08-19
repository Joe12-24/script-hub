import re

# -------------------------------
# 配置
# -------------------------------
DDL_FILE = "yuan/oceanbase_ddl.sql"
OUTPUT_FILE = "table_namesid.txt"

# -------------------------------
# 读取 DDL
# -------------------------------
with open(DDL_FILE, "r", encoding="utf-8") as f:
    ddl_text = f.read()

# -------------------------------
# 匹配 CREATE TABLE 的表名
# -------------------------------
# 支持可选库名和 IF NOT EXISTS
pattern = re.compile(
    r"CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?[`'\"]?(?:\w+[`'\"]?\.)?[`'\"]?(\w+)[`'\"]?",
    re.I
)

table_names = pattern.findall(ddl_text)

# 去重
table_names = list(dict.fromkeys(table_names))

# -------------------------------
# 输出到文件
# -------------------------------
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    for name in table_names:
        f.write(name + "\n")

print(f"提取到 {len(table_names)} 个表名，已保存到 {OUTPUT_FILE}")
