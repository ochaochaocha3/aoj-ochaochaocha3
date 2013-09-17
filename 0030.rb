# AOJ 0030 Sum of Integers

NUMS = (0..9).to_a
MAX_N = 10
MAX_SUM = 45

n_combinations = Array.new(MAX_N + 1) {Array.new(MAX_SUM + 1, 0)}

(1..MAX_N).each do |n|
  NUMS.combination(n).each do |c|
    n_combinations[n][c.reduce(0, :+)] += 1
  end
end

while line = gets
  n, s = line.split.map(&:to_i)
  break if n.zero? && s.zero?

  if 1 <= n && n <= 10 && 0 <= s && s <= 45
    puts n_combinations[n][s]
  else
    puts 0
  end
end
