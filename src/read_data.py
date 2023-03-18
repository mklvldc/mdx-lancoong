import sqlite3
import os
import sys
from make_mdx_txt import make_mdx_txt
import re

current_pinyin = ''
current_page = ''

data_dic = {}


def read_data_item(line: str):
    parts = line.split(';')
    data_dic[parts[0].strip()] = parts[1].strip()


def read_data_line(line: str):
    line = line.strip()
    if re.match(r'# ', line):
        global current_page
        current_page = line
    elif re.match(r'## ', line):
        global current_pinyin
        current_pinyin = line
    elif line == '':
        pass
    else:
        read_data_item(line)


def read_data_file(file: str):
    with open(file, 'r')as f:
        line = f.readline()
        while(line):
            read_data_line(line)
            line = f.readline()


def main(args) -> None:
    try:
        data_dir = 'data'
        # data_dir = args[1]
    except Exception:
        print('no data dir input')
        exit(1)
    finally:
        pass
    data_files = os.walk(data_dir)
    for _root, _dir, fs in data_files:
        for f in fs:
            read_data_file(os.path.join(data_dir, f))
        global data_dic
        make_mdx_txt('mdx/dict.txt', data_dic)
        exit(0)


if __name__ == '__main__':
    main(sys.argv)
