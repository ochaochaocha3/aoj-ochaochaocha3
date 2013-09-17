# AOJ 0014 Integral

while line = gets
  d = line.to_i
  sum = 0
  x = d

  while x < 600
    sum += d * x * x
    x += d
  end

  puts sum
end
