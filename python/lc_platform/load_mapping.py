import os
import re


def load_mapping(mapping_file):
    mapping = {}
    with open(mapping_file, "r", encoding="utf-8") as f:
        for line in f:
            parts = line.strip().split()
            if len(parts) == 2:
                mapping[parts[0].upper()] = parts[1].lower()
    return mapping


def process_folder(folder_path, mapping_file):
    mapping = load_mapping(mapping_file)

    # 表名匹配正则：前缀(OTC.或OTC142.) + 表名(纯字母数字下划线) + 后面不能是\w字符
    table_name_pattern = re.compile(
        r"(OTC142\.|OTC\.)([A-Za-z0-9_]+)(?![\w])", re.IGNORECASE
    )

    # 序列匹配：前缀+序列名（多层点）+ .NEXTVAL，忽略大小写
    # seq_pattern = re.compile(r'(OTC142\.|OTC\.)((?:[A-Za-z0-9_]+\.)*[A-Za-z0-9_]+)\.NEXTVAL', re.IGNORECASE)
    seq_pattern = re.compile(
        r"(OTC142\.|OTC\.)((?:[A-Za-z0-9_]+\.)*[A-Za-z0-9_]+)\.NEXTVAL(?![A-Za-z0-9_])",
        re.IGNORECASE,
    )

    for root, _, files in os.walk(folder_path):
        for fname in files:
            if not fname.endswith(".xml"):
                continue
            full_path = os.path.join(root, fname)
            with open(full_path, "r", encoding="utf-8") as f:
                content = f.read()

            replaced_info = []  # 替换成功 (原前缀, 原表名, 新前缀, 新表名)
            seq_tables = []  # 序列全名(带.NEXTVAL)
            no_replace_tables = []  # 未替换普通表名(带前缀)

            # 先提取所有序列，避免误替换
            seq_spans = []
            for m in seq_pattern.finditer(content):
                full_seq = m.group(0)
                seq_tables.append(full_seq)
                # seq_spans.append((m.start(), m.end()))
                print(f"[DEBUG] 发现序列: {full_seq}")

            # 临时将序列替换成空格占位符（避免误替换）
            content_masked = []
            last_idx = 0
            for start, end in seq_spans:
                content_masked.append(content[last_idx:start])
                content_masked.append(" " * (end - start))  # 空格占位，保持长度一致
                last_idx = end
            content_masked.append(content[last_idx:])
            content_masked = "".join(content_masked)

            def replacer(m):
                prefix = m.group(1)
                table = m.group(2)
                table_upper = table.upper()

                if table_upper in mapping:
                    new_table = mapping[table_upper]
                    replaced_info.append((prefix, table, "lcinfo_source.", new_table))
                    return "lcinfo_source." + new_table
                else:
                    no_replace_tables.append(prefix + table)
                    return m.group(0)

            new_content = table_name_pattern.sub(replacer, content_masked)

            # 还原序列占位符
            def restore_sequences(text, original, spans):
                result = []
                last_idx = 0
                for start, end in spans:
                    result.append(text[last_idx:start])
                    result.append(original[start:end])
                    last_idx = end
                result.append(text[last_idx:])
                return "".join(result)

            new_content = restore_sequences(new_content, content, seq_spans)

            with open(full_path, "w", encoding="utf-8") as f:
                f.write(new_content)

            print(f"\n=== 文件: {fname} ===")
            # 去重替换记录（保留顺序）
            unique_replaced_info = []
            seen = set()
            for item in replaced_info:
                if item not in seen:
                    unique_replaced_info.append(item)
                    seen.add(item)

            if replaced_info:
                # 去重
                unique_replaced_info = []
                seen = set()
                for item in replaced_info:
                    if item not in seen:
                        unique_replaced_info.append(item)
                        seen.add(item)
                print("替换成功表名:")
                for (
                    old_prefix,
                    old_table,
                    new_prefix,
                    new_table,
                ) in unique_replaced_info:
                    print(f"{old_prefix} {old_table} {new_prefix} {new_table}")
            else:
                print("无替换成功表名")

            if seq_tables:
                print("\n序列表名（含.NEXTVAL，未替换）:")
                for t in sorted(set(seq_tables), key=seq_tables.index):
                    print(t)
            else:
                print("\n无序列表名")

            if no_replace_tables:
                print("\n未替换表名（不含.NEXTVAL）:")
                for t in sorted(set(no_replace_tables), key=no_replace_tables.index):
                    print(t)
            else:
                print("\n无未替换表名")

            print("\n")


if __name__ == "__main__":
    # 修改为你的 XML 文件目录和映射文件路径
    folder_path = "/Users/mac/dev/code/py-tools/parse_xml_get_table_name/xml"
    mapping_file = (
        "/Users/mac/dev/code/py-tools/parse_xml_get_table_name/xml/table_mapping.txt"
    )
    process_folder(folder_path, mapping_file)
