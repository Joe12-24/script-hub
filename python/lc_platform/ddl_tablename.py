import re
import math
# -------------------------------
# 配置
# -------------------------------
DDL_FILE = "yuan/original_ddl.sql"
TABLE_FILE = "yuan/table_list.txt"   # 每行一个表名
FOUND_OUTPUT_FILE = "yuan/oceanbase_ddl.sql"
NOT_FOUND_OUTPUT_FILE = "yuan/not_found_ddl.sql"

# -------------------------------
# 读取表名
# -------------------------------
with open(TABLE_FILE, "r", encoding="utf-8") as f:
    table_list = [line.strip() for line in f if line.strip()]

# -------------------------------
# 读取原始 DDL
# -------------------------------
with open(DDL_FILE, "r", encoding="utf-8") as f:
    ddl_text = f.read()

# -------------------------------
# 调整 VARCHAR 长度
# -------------------------------
def adjust_varchar_length(match):
    col_type = match.group(1)
    length = int(match.group(2))
    new_length = math.ceil(length * 1.2)
    return f"{col_type}({new_length})"

def process_varchar(ddl):
    return re.sub(r"(VARCHAR)\s*\(\s*(\d+)\s*\)", adjust_varchar_length, ddl, flags=re.I)

# -------------------------------
# 匹配所有 CREATE TABLE 语句
# -------------------------------
all_tables_pattern = re.compile(
    r"CREATE\s+TABLE\s+(IF\s+NOT\s+EXISTS\s+)?[`'\"]?(?:\w+[`'\"]?\.)?[`'\"]?\w+[`'\"]?\s*\(.*?\)\s*(COMMENT\s*=\s*'.*?')?;",
    re.S | re.I
)
all_tables_iter = all_tables_pattern.finditer(ddl_text)
all_table_ddls = [m.group(0) for m in all_tables_iter]

# -------------------------------
# 按表名分类并处理 VARCHAR
# -------------------------------
found_ddls = []
not_found_ddls = []

for ddl in all_table_ddls:
    # 提取表名
    name_match = re.search(r"CREATE\s+TABLE\s+(?:IF\s+NOT\s+EXISTS\s+)?[`'\"]?(?:\w+[`'\"]?\.)?[`'\"]?(\w+)[`'\"]?", ddl, re.I)
    table_name_in_ddl = name_match.group(1) if name_match else ""

    # 调整 VARCHAR
    ddl = process_varchar(ddl)

    if table_name_in_ddl in table_list:
        found_ddls.append(ddl)
    else:
        not_found_ddls.append(ddl)

# -------------------------------
# 输出文件
# # -------------------------------
# with open(FOUND_OUTPUT_FILE, "w", encoding="utf-8") as f:
#     f.write("\n\n".join(found_ddls))

with open(NOT_FOUND_OUTPUT_FILE, "w", encoding="utf-8") as f:
    f.write("\n\n".join(not_found_ddls))

print(f"生成已匹配表 DDL 文件：{FOUND_OUTPUT_FILE}")
print(f"未匹配表 DDL 文件：{NOT_FOUND_OUTPUT_FILE}")
