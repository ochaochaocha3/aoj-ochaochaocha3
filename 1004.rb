# AOJ 1004 Pair of Primes

MAX_N = 10000

# エラトステネスの篩
prime = Array.new(MAX_N + 1, true)
prime[0] = prime[1] = false
(2..(Math.sqrt(MAX_N).to_i)).each do |k|
  next unless prime[k]

  l = 2 * k
  until l > MAX_N
    prime[l] = false
    l += k
  end
end

while line = gets
  n = line.to_i
  n_p = 0
  pair = Array.new(n + 1) {|i| n + 1 - i}

  (1..n).each do |i|
    n_p += 1 if prime[i] && prime[pair[i]]
  end

  puts n_p
end
