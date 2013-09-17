# AOJ 0024 Physical Experiments

while line = gets
  v_min = line.to_f
  t = v_min / 9.8
  h_min = 4.9 * t * t
  f = (h_min / 5).ceil + 1

  puts f
end
