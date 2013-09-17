# AOJ 0003 Is it a Right Triangle?
# right triangle: 直角三角形

lines = ARGF.gets.to_i
lines.times do
  a, b, c = ARGF.gets.split(" ").map {|x| x.to_i}.sort
  puts (c * c == a * a + b * b) ? "YES" : "NO"
end
