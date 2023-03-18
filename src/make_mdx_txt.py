def make_mdx_txt(file: str, data: dict):
    with open(file, 'w', encoding='utf-8') as f:
        for key in data.keys():
            f.write(key)
            f.write('\n')
            f.write('<link href="lancoong.css" rel="stylesheet">')
            f.write(data[key])
            f.write('\n</>\n')
