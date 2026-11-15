#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
批量模板替换脚本

功能：
1. 输入一个整数下标范围 [a, b]；
2. 搜索当前文件夹下所有文件名中包含 "(index)" 的文件；
3. 对每个文件生成 b-a+1 份副本；
4. 每份副本的文件名和文件内容中的 "(index)" 都替换成 [a, b] 中的对应整数。

用法：
    python replace_index.py            # 交互式输入范围
    python replace_index.py 1-5        # 命令行直接给范围
    python replace_index.py "[1,5]"    # 也支持这种写法
"""

import re
import sys
from pathlib import Path

PLACEHOLDER = "(index)"


def parse_range(text: str):
    """从字符串中解析出两个整数，支持 '1,5'、'1-5'、'[1 5]' 等写法。"""
    nums = re.findall(r"\d+", text)
    if len(nums) != 2:
        raise ValueError("请输入两个整数，例如：1,5 或 1-5 或 [1 5]")
    a, b = int(nums[0]), int(nums[1])
    if a > b:
        a, b = b, a
    return a, b


def main():
    raw = sys.argv[1] if len(sys.argv) > 1 else input("请输入下标范围 [a,b]（如 1,5）：")
    try:
        a, b = parse_range(raw)
    except ValueError as e:
        print(f"错误：{e}")
        sys.exit(1)

    values = range(a, b + 1)
    folder = Path.cwd()

    # 只取当前文件夹下的普通文件（不递归子文件夹）
    targets = [p for p in folder.iterdir() if p.is_file() and PLACEHOLDER in p.name]
    if not targets:
        print(f"当前目录 {folder} 下没有找到文件名包含 {PLACEHOLDER} 的文件。")
        return

    print(f"范围：{a} ~ {b}，共 {b - a + 1} 份/每个模板")
    print(f"找到 {len(targets)} 个模板文件\n")

    ph_bytes = PLACEHOLDER.encode()

    for src in targets:
        data = src.read_bytes()          # 以二进制读取，文本/二进制文件都能处理
        for i in values:
            new_name = src.name.replace(PLACEHOLDER, str(i))
            dst = folder / new_name

            # 安全性检查（正常情况下不会命中，因为替换后名字已不含占位符）
            if dst.resolve() == src.resolve():
                continue

            if dst.exists():
                print(f"[覆盖] {new_name}")
            else:
                print(f"[生成] {new_name}")

            dst.write_bytes(data.replace(ph_bytes, str(i).encode()))

    print("\n完成。原始模板文件已保留，如需删除请手动处理。")


if __name__ == "__main__":
    main()