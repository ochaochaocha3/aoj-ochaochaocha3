# AOJ 0009 Prime Number

$MAX_N = 999999
$prime = Array.new($MAX_N + 1, true)
$sum_primes = Array.new($MAX_N + 1, 0)

# エラトステネスの篩
def eratosthenes
  max = Math.sqrt($MAX_N).to_i

  $prime[0] = $prime[1] = false

  (2..max).each do |x|
    next unless $prime[x]

    k = 2 * x
    while k <= $MAX_N
      $prime[k] = false
      k += x
    end
  end
end

# 素数の数の累積和の計算
def calc_sum
  sum = 0
  (2..$MAX_N).each do |x|
    sum += 1 if $prime[x]
    $sum_primes[x] = sum
  end
end

eratosthenes
calc_sum

nums = ARGF.each_line.map {|line| line.to_i}
nums.each do |n|
  puts $sum_primes[n]
end
