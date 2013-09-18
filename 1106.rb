# AOJ 1106 Factorization of Quadratic Formula

# a の因数分解。
# p >= r を満たすすべての [p, q] を返す。
def factorize_a(a)
  max = Math.sqrt(a).to_i
  (1..max).select {|x| a % x == 0}.map {|x| [a / x, x]}
end

# c の因数分解。
# すべての [q, s] を返す。
def factorize_c(c, p, r)
  if c.zero?
    raise "c is zero"
  elsif c > 0
    max = Math.sqrt(c).to_i

    factors_plus_1 = (1..max).select {|x| c % x == 0}.map {|x| [c / x, x]}
    factors_plus_2 = factors_plus_1.map {|q, s| [s, q]}
    factors_plus = factors_plus_1 + factors_plus_2
    factors_minus = factors_plus.map {|q, s| [-q, -s]}

    factors_plus + factors_minus
  else
    max = Math.sqrt(-c).to_i

    factors1 = (1..max).select {|x| c % x == 0}.map {|x| [-c / x, -x]}
    factors2 = factors1.map {|q, s| [s, q]}
    factors3 = factors1.map {|q, s| [-q, -s]}
    factors4 = factors3.map {|q, s| [s, q]}

    factors1 + factors2 + factors3 + factors4
  end
end

while line = gets
  a, b, c = line.split.map(&:to_i)
  break if a.zero? && b.zero? && c.zero?

  possible = false

  factorize_a(a).each do |p, r|
    if c.zero?
      if b % p == 0
        possible = true
        s = b / p
        q = 0
      elsif b % r == 0
        possible = true
        q = b / r
        s = 0
      else
        next
      end

      possible = true
      q, s = [s, q] if p == r && q < s
      puts [p, q, r, s].join(" ")
    else
      factorize_c(c, p, r).each do |q, s|
        if p * s + q * r == b
          possible = true
          q, s = [s, q] if p == r && q < s
          puts [p, q, r, s].join(" ")
          break
        end
      end
    end

    break if possible
  end

  puts "Impossible" unless possible
end
