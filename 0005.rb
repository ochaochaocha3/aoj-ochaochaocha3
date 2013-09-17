# AOJ 0005 GCD and LCM
# 最大公約数と最小公倍数

def gcd(a, b)
  if b.zero?
    a
  else
    gcd(b, a % b)
  end
end

def lcm(a, b)
  d = gcd(a, b)
  d * (a / d) * (b / d)
end

pairs = ARGF.each_line.map {|line| line.split(" ").map {|x| x.to_i}}
pairs.each do |a, b|
  puts [gcd(a, b), lcm(a, b)].join(" ")
end
