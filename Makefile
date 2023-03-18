all: 南昌方言詞典.mdx

南昌方言詞典.mdx: mdx/dict.txt
	mdict --title mdx/title.html --description mdx/description.html -a mdx/dict.txt mdx/dict.mdx

mdx/dict.txt:
