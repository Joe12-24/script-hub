import re
import math
# -------------------------------
# 配置
# -------------------------------
DDL_FILE = "yuan/original_ddl.sql"
TABLE_FILE = "yuan/table_list.txt"   # 每行一个表名
OUTPUT_FILE = "yuan/oceanbase_ddl.sql"
# -------------------------------
# 读取表名
# -------------------------------
with open(TABLE_FILE, "r", encoding="utf-8") as f:
    table_list = [line.strip() for line in f if line.strip()]

# -------------------------------
# 读取 DDL
# -------------------------------
with open(DDL_FILE, "r", encoding="utf-8") as f:
    ddl_text = f.read()

# -------------------------------
# 放大 VARCHAR 长度
# -------------------------------
def adjust_varchar_length(match):
    col_type = match.group(1)
    length = int(match.group(2))
    new_length = math.ceil(length * 1.2)
    return f"{col_type}({new_length})"

# -------------------------------
# 处理每张表
# -------------------------------
def process_table_ddl(table_name, ddl_text):
    # 匹配 CREATE TABLE，允许库名和表注释
    table_pattern = re.compile(
        rf"CREATE\s+TABLE\s+(IF\s+NOT\s+EXISTS\s+)?[`'\"]?(?:\w+[`'\"]?\.)?[`'\"]?{re.escape(table_name)}[`'\"]?\s*\((.*?)\)\s*(COMMENT\s*=\s*'.*?')?;",
        re.S | re.I
    )
    match = table_pattern.search(ddl_text)
    if not match:
        print(f"表 {table_name} 没找到")
        return None

    table_body = match.group(2)
    table_comment = match.group(3) or ""

    # 删除已有的 ID 列（无论类型）
    id_pattern = re.compile(
        r"^\s*`ID`\s+\w+\s*(?:\(\d+(?:,\s*\d+)?\))?\s*(?:NOT\s+NULL)?\s*(?:AUTO_INCREMENT)?\s*(?:PRIMARY\s+KEY)?\s*(?:COMMENT\s+'.*?')?\s*(,)?\s*$",
        re.I | re.M
    )
    table_body = id_pattern.sub("", table_body)

    # 删除已有约束包含 ID 的 PRIMARY KEY
    pk_pattern = re.compile(
        r"^\s*(?:constraint\s+`.*?`\s+)?primary\s+key\s*\(\s*`ID`\s*\)\s*(,)?\s*$",
        re.I | re.M
    )
    table_body = pk_pattern.sub("", table_body)

    # 调整 VARCHAR 长度
    table_body = re.sub(r"(VARCHAR)\s*\(\s*(\d+)\s*\)", adjust_varchar_length, table_body, flags=re.I)

    # 清理多余空行并保持逗号格式
    table_body_lines = [line.rstrip() for line in table_body.splitlines() if line.strip()]
    table_body = ",\n  ".join(table_body_lines)

    # 添加统一自增主键
    table_body += ",\n  `ID` BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY"

    # 保留库名 + 表名
    ddl_prefix_pattern = re.compile(
        rf"(CREATE\s+TABLE\s+(IF\s+NOT\s+EXISTS\s+)?[`'\"]?(?:\w+[`'\"]?\.)?{re.escape(table_name)}[`'\"]?)",
        re.I
    )
    ddl_prefix_match = ddl_prefix_pattern.search(match.group(0))
    ddl_prefix = ddl_prefix_match.group(1) if ddl_prefix_match else f"CREATE TABLE `{table_name}`"

    # 生成新的建表语句
    new_ddl = f"{ddl_prefix} (\n  {table_body}\n) {table_comment};"
    return new_ddl

# -------------------------------
# 遍历表生成新的 DDL
# -------------------------------
output_ddls = []
for table_name in table_list:
    new_ddl = process_table_ddl(table_name, ddl_text)
    if new_ddl:
        output_ddls.append(new_ddl)

# -------------------------------
# 输出到文件
# -------------------------------
with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
    f.write("\n\n".join(output_ddls))

print(f"生成 OceanBase DDL 完成，输出文件：{OUTPUT_FILE}")