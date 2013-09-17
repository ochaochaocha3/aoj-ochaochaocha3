# AOJ 0053 Sum of Prime Numbers

MAX_N = 10000

def prime?(n)
  max = Math.sqrt(n).to_i
  not_prime = (2..max).any? {|x| n % x == 0}
  !not_prime
end

sum_of_prime_numbers = [0]
n_primes = 0
last_sum = 0
i = 2
while n_primes < MAX_N
  if prime?(i)
    n_primes += 1
    last_sum += i
    sum_of_prime_numbers << last_sum
  end
  i += 1
end

while line = gets
  n = line.to_i
  break if n.zero?

  puts sum_of_prime_numbers[n]
end
