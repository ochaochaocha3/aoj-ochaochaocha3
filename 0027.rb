# AOJ 0027 What day is today?

days_in_a_month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
offset = []
days_in_a_month.each.with_index do |d, m|
  offset[m] = m.zero? ? 0 : days_in_a_month[0..(m - 1)].reduce(0, :+)
end

the_day = %w[Thursday Friday Saturday Sunday Monday Tuesday Wednesday]

loop do
  month, day = gets.split.map(&:to_i)
  break if month.zero? && day.zero?

  days = offset[month - 1] + (day - 1)
  puts the_day[days % 7]
end
