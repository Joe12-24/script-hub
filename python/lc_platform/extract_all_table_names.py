import os
import re
import xml.etree.ElementTree as ET
from collections import defaultdict
from openpyxl import Workbook

SQL_TAGS = {"select", "update", "insert", "delete"}


def extract_sql_from_xml(xml_path):
    try:
        tree = ET.parse(xml_path)
        root = tree.getroot()
        sql_list = []
        for elem in root.iter():
            if elem.tag.lower() in SQL_TAGS:
                sql_text = "".join(elem.itertext()).strip()
                if sql_text:
                    sql_list.append((sql_text, elem.tag))
        return sql_list
    except Exception as e:
        print(f"[解析失败] {xml_path}: {e}")
        return []


def extract_table_names(sql_text):
    patterns = [
        r"\bfrom\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\bjoin\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\bupdate\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\bdelete\s+from\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\binsert\s+into\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\bmerge\s+into\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\breplace\s+into\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\btruncate\s+table\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\block\s+table\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\bdesc\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
        r"\bexplain\s+.*?\bfrom\s+([a-zA-Z_][\w]*(?:\.[a-zA-Z_][\w]*)?)",
    ]

    found = set()
    for pattern in patterns:
        matches = re.findall(pattern, sql_text, flags=re.IGNORECASE | re.DOTALL)
        for full_match in matches:
            found.add(full_match.strip())
    return found


def extract_nextval_sequences(sql_text):
    pattern = re.compile(
        r"\b([a-zA-Z0-9_]+\.[a-zA-Z0-9_\.]+)\.NEXTVAL\b", re.IGNORECASE
    )
    return set(pattern.findall(sql_text))


def split_table_name(full_name):
    """拆分表名，返回 (前缀, 裸表名)"""
    parts = full_name.split(".")
    if len(parts) == 2:
        return parts[0], parts[1]
    return "", parts[0]  # 没前缀的情况


def walk_and_collect(folder):
    table_to_files = defaultdict(set)        # (前缀, 表) -> 文件集合
    seq_to_tables = defaultdict(set)         # 序列 -> {(前缀, 表)} 集合
    seq_to_files = defaultdict(set)          # 序列 -> 文件集合

    for root, _, files in os.walk(folder):
        for fname in files:
            if fname.lower().endswith(".xml"):
                full_path = os.path.join(root, fname)
                sqls = extract_sql_from_xml(full_path)
                for sql, tag in sqls:
                    tables = extract_table_names(sql)
                    sequences = extract_nextval_sequences(sql)

                    # 表名
                    for table in tables:
                        schema, bare = split_table_name(table)
                        table_to_files[(schema, bare)].add(fname)

                    # 序列
                    for seq in sequences:
                        if tables:
                            for t in tables:
                                schema, bare = split_table_name(t)
                                seq_to_tables[seq].add((schema, bare))
                        else:
                            seq_to_tables[seq].add(("", "(未识别表)"))
                        seq_to_files[seq].add(fname)

    return table_to_files, seq_to_tables, seq_to_files


def save_to_excel(table_to_files, seq_to_tables, seq_to_files, output_file):
    wb = Workbook()

    # Sheet1: 表
    ws1 = wb.active
    ws1.title = "表名"
    ws1.append(["表前缀", "表名", "所在Mapper文件"])
    for (schema, bare), files in sorted(table_to_files.items()):
        ws1.append([schema, bare, ", ".join(sorted(files))])

    # Sheet2: 序列
    ws2 = wb.create_sheet("序列")
    ws2.append(["序列名", "表前缀", "表名", "所在Mapper文件"])
    for seq, table_set in sorted(seq_to_tables.items()):
        tables_str = []
        for schema, bare in sorted(table_set):
            tables_str.append((schema, bare))
        # 多表时分多行
        for schema, bare in tables_str:
            ws2.append([seq + ".NEXTVAL", schema, bare, ", ".join(sorted(seq_to_files[seq]))])

    wb.save(output_file)


if __name__ == "__main__":
    FOLDER_PATH = "/Users/mac/dev/code/py-tools/parse_xml_get_table_name/xml"
    OUTPUT_FILE = "sql_tables_and_sequences.xlsx"

    tables, sequences, seq_files = walk_and_collect(FOLDER_PATH)
    save_to_excel(tables, sequences, seq_files, OUTPUT_FILE)

    print(f"已生成 Excel: {OUTPUT_FILE}")
