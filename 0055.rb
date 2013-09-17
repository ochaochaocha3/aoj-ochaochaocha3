# AOJ 0055 Sequence

while line = gets
  a = [line.to_f]
  9.times do |i|
    # すべての偶数番目の項は一つ前の項に 2 を掛けたものと等しい数である。
    # すべての奇数番目の項は一つ前の項を 3 で割ったものと等しい数である。
    a[i + 1] = i.even? ? (a[i] * 2.0) : (a[i] / 3.0)
  end
  puts a.reduce(0, :+)
end
