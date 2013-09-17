# AOJ 0023 Circles Intersection

n = gets.to_i
n.times do
  xa, ya, ra, xb, yb, rb = gets.split.map {|v| v.to_f}

  dxab = xb - xa
  dyab = yb - ya
  rab2 = dxab * dxab + dyab * dyab

  if rab2 > (ra + rb) * (ra + rb)
    # do not overlap
    puts 0
  elsif rab2 < (rb - ra) * (rb - ra)
    if ra > rb
      # B is in A
      puts 2
    else
      # A is in B
      puts -2
    end
  elsif rab2 == 0 && ra == rb
    # A is B
  else
    # circumference of A and B intersect
    puts 1
  end
end
