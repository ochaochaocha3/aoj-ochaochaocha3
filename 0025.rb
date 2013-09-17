# AOJ 0025 Hit and Blow

while line = gets
  a = line.split.map {|v| v.to_i}
  b = gets.split.map {|v| v.to_i}

  n_hits = n_blows = 0
  b.each_with_index do |x, i|
    i_x_a = a.index(x)

    if i_x_a
      if i_x_a == i
        n_hits += 1
      else
        n_blows += 1
      end
    end
  end

  puts [n_hits, n_blows].join(" ")
end
