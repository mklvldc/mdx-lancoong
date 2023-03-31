all: 南昌方言詞典.mdx 南昌方言詞典.mdd

南昌方言詞典.mdx: mdx/dict.txt src/make_mdx_txt.rb
	mdict --title mdx/title.html --description mdx/description.html -a mdx/dict.txt out/南昌方言詞典.mdx

mdx/dict.txt:
	ruby ./src/make_mdx_txt.rb > mdx/dict.txt

南昌方言詞典.mdd: mdd/*
	mdict --title mdx/title.html --description mdx/description.html -a mdd out/南昌方言詞典.mdd

# pa | ruby -e'a=$<.readlines; a1=a[0].split(" "); a2=a[1].split(" ").zip(a1);a2.each{|i| puts "#{i[1]}, #{i[0]}"}' |co
