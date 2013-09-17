# AOJ 0084 Search Engine

require "strscan"

s = StringScanner.new(gets.chomp)
words = []

until s.eos?
  s.skip /[ \.,]+/
  if s.scan(/[^ \.,]+/)
    words << s[0] if (3..6).include?(s[0].length)
  end
end

puts words.join(" ")
