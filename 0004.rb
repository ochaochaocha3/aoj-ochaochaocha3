# AOJ 0004 Simultaneous Equation

def solve(eq)
  m = []
  m << eq[0..2]
  m << eq[3..5]

  # 前進消去
  r0 = m[0][0]
  m[0].map! {|x| x / r0}
  r1 = -m[1][0]
  m[1].map!.with_index {|x, i| x + r1 * m[0][i]}

  # 後退消去
  r1 = m[1][1]
  m[1].map! {|x| x / r1}
  r0 = -m[0][1]
  m[0].map!.with_index {|x, i| x + r0 * m[1][i]}

  [m[0][2], m[1][2]]
end

eqs = ARGF.each_line.map {|line| line.split(" ").map {|v| v.to_f}}

eqs.each do |eq|
  solution = solve(eq)
  puts solution.map {|x| "%.3f".%(x)}.join(" ")
end
