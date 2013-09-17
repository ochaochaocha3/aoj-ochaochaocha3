# AOJ 1044 CamelCase

def underscored(s)
  s.gsub(/([A-Z])/, '_\1').gsub(/_{2,}/, "_").sub(/^_/, "").downcase
end

def upper_camel_case(s)
  s = underscored(s)
  words = s.split("_").map {|word| word.capitalize}
  words.join("")
end

def lower_camel_case(s)
  s = underscored(s)
  words = s.split("_").map {|word| word.capitalize}
  words[0].downcase!
  words.join("")
end

ARGF.each_line do |line|
  line.chomp!
  name, type = line.split(" ")

  case type
  when "X"
    break
  when "U"
    puts upper_camel_case(name)
  when "L"
    puts lower_camel_case(name)
  when "D"
    puts underscored(name)
  end
end
