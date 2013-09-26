# AOJ 0034 Railway Lines

while line = gets
  dat = line.split(",").map(&:to_i)
  lengths, v1, v2 = dat[0..9], dat[10], dat[11]

  distances = [0]
  lengths.each.with_index(1) do |l, i|
    distances[i] = distances[i - 1] + l
  end

  x = v1.to_f / (v1 + v2) * distances.last

  distances.each_with_index do |d, i|
    if x <= d
      puts i
      break
    end
  end
end
