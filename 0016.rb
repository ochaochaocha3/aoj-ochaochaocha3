# AOJ 0016 Treasure Hunt

x = y = 0
angle = 90

while line = gets
  r, d_angle = line.split(",").map {|v| v.to_i}
  break if r.zero? && d_angle.zero?

  rad = angle * Math::PI / 180
  x += r * Math.cos(rad)
  y += r * Math.sin(rad)

  angle -= d_angle
  angle += 360 if angle < 0
  angle = angle % 360
end

puts x.to_i
puts y.to_i
