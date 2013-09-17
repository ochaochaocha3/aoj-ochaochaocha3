# AOJ 0211 FizzBuzz

def fizzbuzz(k)
  case
  when k % 3 == 0 && k % 5 == 0
    "FizzBuzz"
  when k % 3 == 0
    "Fizz"
  when k % 5 == 0
    "Buzz"
  else
    k.to_s
  end
end

while line = gets
  n_players, n_words = line.split.map {|v| v.to_i}
  break if n_players.zero? && n_words.zero?

  living_players = (1..n_players).to_a
  words = []
  n_words.times {words << gets.chomp}

  player = 0
  words.each.with_index(1) do |word, i|
    break if living_players.length == 1

    if word == fizzbuzz(i)
      # 正解
      player += 1
    else
      # 間違い
      living_players.delete_at(player)
    end

    player %= living_players.length
  end

  puts living_players.join(" ")
end
