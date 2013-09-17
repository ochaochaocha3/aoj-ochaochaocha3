# AOJ 0058 Orthogonal

E = 1e-10
while line = gets
  xA, yA, xB, yB, xC, yC, xD, yD = line.split.map {|v| v.to_f}
  puts ((xB - xA) * (xD - xC) + (yB - yA) * (yD - yC)).abs < E ? "YES" : "NO"
end
