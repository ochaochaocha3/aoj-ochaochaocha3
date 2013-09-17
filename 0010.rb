# AOJ 0010 Circumscribed Circle of a Triangle
# 三角形の外接円

require "matrix"

n = gets.to_i

n.times do
  x1, y1, x2, y2, x3, y3 = gets.split(" ").map {|v| v.to_f}
  dx12 = x2 - x1
  dy12 = y2 - y1
  dx13 = x3 - x1
  dy13 = y3 - y1

  # 点 1 を表す位置ベクトル
  r1 = Vector[x1, y1]
  # 点 2 を表す位置ベクトル
  r2 = Vector[x2, y2]
  # 点 1 と点 2 の中点を表す位置ベクトル
  m12 = 0.5 * (r1 + r2)
  # 点 1 から点 2 へのベクトル
  v12 = Vector[dx12, dy12]
  # v12 を 90° 回転したベクトル
  v12v = Vector[-dy12, dx12]

  # 連立方程式
  #  dx12 * s + dx13 * t = (dy13 - dy12) / 2
  # -dy12 * s - dy13 * t = (dx13 - dx12) / 2
  coeff = Matrix[
    [dx12, dx13],
    [-dy12, -dy13]
  ]
  const = Vector[
    0.5 * (dy13 - dy12),
    0.5 * (dx13 - dx12)
  ]
  # 連立方程式を解く
  x = coeff.inv * const

  # 外接円の中心を表すベクトル
  rp = m12 + x[0] * v12v
  px = rp[0]
  py = rp[1]

  # 外接円の半径を求める
  dx1p = px - x1
  dy1p = py - y1
  r = Math.sqrt(dx1p * dx1p + dy1p * dy1p)

  # 出力
  printf "%.3f %.3f %.3f\n", px, py, r
end
