# AOJ 0032 Plastic Board

n_rectangles = n_lozenges = 0
while line = gets
  l1, l2, ld = line.split(",").map(&:to_i)

  if l1 * l1 + l2 * l2 == ld * ld
    n_rectangles += 1
  elsif l1 == l2
    n_lozenges += 1
  end
end

puts n_rectangles, n_lozenges
