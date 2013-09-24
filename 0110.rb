# AOJ 0110 Alphametic

while line = gets
  m = /([0-9X]+)\+([0-9X]+)=([0-9X]+)/.match(line)
  next unless m

  x_s, y_s, z_s = m[1], m[2], m[3]
  numbers = (0..9).to_a
  [x_s, y_s, z_s].each do |s|
    if s.length > 1 && s[0] == "X"
      numbers -= [0]
      break
    end
  end

  found = false
  numbers.each do |n|
    x, y, z = [x_s, y_s, z_s].map {|s| s.gsub("X", n.to_s).to_i}
    if x + y == z
      found = true
      puts n
      break
    end
  end

  puts "NA" unless found
end
