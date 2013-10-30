# AOJ 0040 Affine Cipher

def decode(s, a_inv, b)
  byte_a = "a".ord

  if s.is_a?(String)
    words = [s]
  elsif s.is_a?(Array)
    words = s
  else
    raise TypeError
  end

  words.map {|word|
    word.bytes.map {|byte|
      d = byte - byte_a
      # 26 を法とすると
      # F(c) \equiv a * c + b は
      # c \equiv a^{-1} * (F(c) - b) と同値
      ((a_inv * (d - b)) % 26 + byte_a).chr
    }.join
  }.join(" ")
end

A_INV = [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25]

n = gets.to_i
n.times do
  words = gets.chomp.split
  words_4 = words.select {|word| word.length == 4}

  # 鍵を探す
  a_inv = b = nil
  words_4.each do |word|
    break if a_inv && b

    A_INV.each do |ai|
      break if a_inv && b

      26.times do |b_ai|
        case decode(word, ai, b_ai)
        when "that", "this"
          a_inv, b = ai, b_ai
          break
        end
      end
    end
  end

  puts decode(words, a_inv, b)
end
