# AOJ 0008 Sum of 4 Integers

while line = gets
  n = line.to_i
  combinations = 0

  10.times do |a|
    10.times do |b|
      10.times do |c|
        10.times do |d|
          combinations += 1 if (a + b + c + d == n)
        end
      end
    end
  end

  puts combinations
end
