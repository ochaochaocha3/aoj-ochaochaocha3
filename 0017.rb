# AOJ 0017 Caesar Cipher

while line = gets
  words = line.split.map {|word| word.gsub(".", "")}

  shift = nil
  words3 = words.select {|word| word.length == 3}
  words4 = words.select {|word| word.length == 4}

  bytes_this, bytes_that, bytes_the = %w(this that the).map {|w| w.bytes}
  byte_min = "a".bytes[0]
  byte_max = "z".bytes[0]

  words3.each do |word|
    # the を探す
    shift_w = word.bytes[0] - bytes_the[0]
    shifted_word_bytes = word.bytes.map do |b|
      shifted_b = b - shift_w

      if shifted_b < byte_min
        shifted_b += 26
      elsif shifted_b > byte_max
        shifted_b -= 26
      end

      shifted_b
    end

    if shifted_word_bytes == bytes_the
      shift = shift_w
      break
    end
  end

  unless shift
    words4.each do |word|
      # this を探す
      shift_w_this = word.bytes[0] - bytes_this[0]
      shifted_word_bytes_this = word.bytes.map do |b|
        shifted_b = b - shift_w_this

        if shifted_b < byte_min
          shifted_b += 26
        elsif shifted_b > byte_max
          shifted_b -= 26
        end

        shifted_b
      end

      if shifted_word_bytes_this == bytes_this
        shift = shift_w_this
        break
      end

      # that を探す
      shift_w_that = word.bytes[0] - bytes_that[0]
      shifted_word_bytes_that = word.bytes.map do |b|
        shifted_b = b - shift_w_that

        if shifted_b < byte_min
          shifted_b += 26
        elsif shifted_b > byte_max
          shifted_b -= 26
        end

        shifted_b
      end

      if shifted_word_bytes_that == bytes_that
        shift = shift_w_that
        break
      end
    end
  end

  decoded_text = line.chomp.gsub(/[a-z]/) do |c|
    b = c.bytes[0] - shift
    if b < byte_min
      b += 26
    elsif b > byte_max
      b -= 26
    end

    "%c".%(b)
  end

  puts decoded_text
end
