# AOJ 0028 Mode Value

frequency = Array.new(101, 0)

while line = gets
  n = line.to_i
  frequency[n] += 1
end

max = frequency.max
frequency.each_with_index do |n, i|
  puts i if n == max
end
