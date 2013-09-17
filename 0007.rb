# AOJ 0007 Debt Hell

week = gets.to_i
debt = 100000

week.times do
  debt = (debt * 1.05 / 1000).ceil * 1000
end

puts debt
