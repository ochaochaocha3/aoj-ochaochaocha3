# AOJ 0029 English Sentence

words = gets.chomp.split

frequency = Hash.new {|hash, key| hash[key] = 0}
words.each do |word|
  frequency[word] += 1
end

most_frequent_word = nil
max_frequency = 0
frequency.each do |word, f|
  if f > max_frequency
    most_frequent_word = word
    max_frequency = f
  end
end

longest_word = nil
max_length = 0
words.each do |word|
  if word.length > max_length
    longest_word = word
    max_length = word.length
  end
end

puts [most_frequent_word, longest_word].join(" ")
