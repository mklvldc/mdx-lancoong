#!/usr/bin/env ruby
# frozen_string_literal: true

def make_appendix
  `ls mdd/appendix`.split.map do |f|
    "#{f.sub('.png', '')}\n\
<img src=\"entries/#{f}\" width=\"100%\">\n\
</>\n"
  end
end

def make_entries
  `ls mdd/entries`.split.each_slice(2).map do |a, b|
    "#{a.sub('.png', '')}\n\
<img src=\"entries/#{a}\" width=\"100%\"><a href=\"entry://#{b.sub('.png', '')}\"><br>右半页</a>\n\
</>\n\
#{b.sub('.png', '')}\n\
<img src=\"entries/#{b}\" width=\"100%\"><a href=\"entry://#{a.sub('.png', '')}\"><br>左半页</a>\n\
</>\n"
  end
end

def make_index
  cur = ''
  File.readlines('/Users/lui/o/南昌方言词典/mdx-lancoong/索引.csv').map do |l|
    a = l.chomp.split(',')
    cur = a[0] if a[0] != ''
    "#{cur}\n\
@@@LINK=page_#{a[1].rjust(3, '0')}_1L\n\
</>\n"
  end
end

puts make_appendix.concat(make_entries).concat(make_index)
