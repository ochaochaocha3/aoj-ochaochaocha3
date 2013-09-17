# AOJ 0259 All Numbers Lead to 6174

while line = gets
  line.chomp!
  break if line == "0000"

  if line == "6174"
    puts 0
    next
  elsif line.to_i % 1111 == 0
    puts "NA"
    next
  end

  n = line
  n_op = 0
  loop do
    n_op += 1

    digits = n.each_char.map {|c| c.to_i}.sort
    l = digits.reverse.join("").to_i
    s = digits.join("").to_i

    break if l - s == 6174

    n = "%04d".%(l - s)
  end

  puts n_op
end
