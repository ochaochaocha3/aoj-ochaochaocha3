# AOJ 0035 Is it Convex?

require "matrix"

while line = gets
  dat = line.split(",").map(&:to_f)

  ra = Vector[dat[0], dat[1]]
  rb = Vector[dat[2], dat[3]]
  rc = Vector[dat[4], dat[5]]
  rd = Vector[dat[6], dat[7]]

  points = [ra, rb, rc, rd]

  convex = true
  points.each_with_index do |r, i|
    # r の隣接点が、r と他の 2 点で作られる三角形の内部にあれば
    # 凹んでいる
    r_next = points[(i + 1) % 4] - r
    r1 = points[i - 1] - r
    r2 = points[(i + 2) % 4] - r

    st = Matrix[r1, r2].transpose.inv * r_next
    s, t = st[0], st[1]
    if 0 < s + t && s + t < 1 && 0 < s && s < 1 && 0 < t && t < 1
      convex = false
      break
    end
  end

  puts convex ? "YES" : "NO"
end
