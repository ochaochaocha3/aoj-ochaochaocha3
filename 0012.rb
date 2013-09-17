# AOJ 0012 A Point in a Triangle

require "matrix"

while line = gets
  x1, y1, x2, y2, x3, y3, xp, yp = line.split.map {|v| v.to_f}
  dx12 = x2 - x1
  dy12 = y2 - y1
  dx13 = x3 - x1
  dy13 = y3 - y1
  dx1p = xp - x1
  dy1p = yp - y1

  coeff = Matrix[
    [dx12, dx13],
    [dy12, dy13]
  ]
  c = Vector[
    dx1p,
    dy1p
  ]
  x = coeff.inv * c
  s = x[0]
  t = x[1]

  if 0 < s && s < 1 && 0 < t && t < 1 && s + t < 1
    puts "YES"
  else
    puts "NO"
  end
end
