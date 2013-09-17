# AOJ 0066 Tic Tac Toe

while line = gets
  r1, r2, r3 = line[0..2], line[3..5], line[6..8]
  c1 = line[0] + line[3] + line[6]
  c2 = line[1] + line[4] + line[7]
  c3 = line[2] + line[5] + line[8]
  d1 = line[0] + line[4] + line[8]
  d2 = line[2] + line[4] + line[6]

  result = "d"
  [r1, r2, r3, c1, c2, c3, d1, d2].each do |l|
    if l == "ooo"
      result = "o"
      break
    elsif l == "xxx"
      result = "x"
      break
    end
  end

  puts result
end
