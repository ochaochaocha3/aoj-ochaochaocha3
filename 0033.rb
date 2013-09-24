# AOJ 0033 Ball

n = gets.to_i
n.times do
  balls = gets.split.map(&:to_i).reverse
  left, right = [0], [0]

  failed = false
  until balls.empty?
    ball = balls.pop

    if ball > left.last
      left << ball
    elsif ball > right.last
      right << ball
    else
      failed = true
      break
    end
  end

  puts failed ? "NO" : "YES"
end
