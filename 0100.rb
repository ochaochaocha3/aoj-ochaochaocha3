# AOJ 0100 Sale Result

while line = gets
  n_data = line.to_i
  break if n_data.zero?

  sale = Hash.new(0)
  n_data.times do
    i, p, q = gets.split.map {|v| v.to_i}
    sale[i] += p * q
  end

  good_workers = sale.select {|k, v| v >= 1000000}.map {|k, v| k}

  if good_workers.empty?
    puts "NA"
  else
    good_workers.each {|i| puts i}
  end
end
