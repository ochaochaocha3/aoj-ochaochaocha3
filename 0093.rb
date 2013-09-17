# AOJ 0093 Leap Year

leap_year = Array.new(3001, false)
3001.times do |i|
  leap_year[i] = true if i % 4 == 0 && (i % 400 == 0 || i % 100 != 0)
end

leap_years = []
while line = gets
  a, b = line.split.map {|v| v.to_i}
  break if a.zero? && b.zero?

  y = (a..b).to_a.select {|i| leap_year[i]}
  if y.empty?
    leap_years << "NA"
  else
    leap_years << y.join("\n")
  end
end

puts leap_years.join("\n\n")
