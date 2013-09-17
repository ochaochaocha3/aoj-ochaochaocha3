# AOJ 0081 A Symmetric Point

# 2 元 1 次方程式を解く
def solve_eq(eq)
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

# データから対称点の座標を求める
# P1 P2 の方程式：(y2 - y1) * x + (x1 - x2) * y = x1 * y2 - x2 * y1
# QR の方程式：(x2 - x1) * x + (y2 - y1) * y = (y2 - y1) * yq + (x2 - x1) * xq
def solve(data)
  x1, y1, x2, y2, xq, yq = data

  if (x1 == x2)
    [xq + 2 * (x1 - xq), yq]
  elsif (y1 == y2)
    [xq, yq + 2 * (y1 - yq)]
  else
    xc, yc = solve_eq([
      y2 - y1, x1 - x2, x1 * y2 - x2 * y1,
      x2 - x1, y2 - y1, (y2 - y1) * yq + (x2 - x1) * xq
    ])
    [xq + 2 * (xc - xq), yq + 2 * (yc - yq)]
  end
end

ARGF.each_line.map {|line| line.split(",").map {|x| x.to_f}}.each do |data|
  puts solve(data).join(" ")
end
