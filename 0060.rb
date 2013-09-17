# AOJ 0060 Card Game

while line = gets
  cards = (1..10).to_a
  c1, c2, c3 = line.split.map {|v| v.to_i}
  cards -= [c1, c2, c3]
  my_sum = c1 + c2

  total = 0
  no_overflow = 0

  cards.each do |c4|
    rest = cards - [c4]

    total += rest.length
    other_sum = c3 + c4
    max = 20 - my_sum
    no_overflow += rest.select {|c| c <= max}.length
  end

  puts (no_overflow.to_f / total >= 0.5) ? "YES" : "NO"
end
