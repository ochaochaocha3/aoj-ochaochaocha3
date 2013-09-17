# AOJ 0015 National Budget

class Bigint
  MAX_DIGIT = 80

  attr_reader :digit_num

  def initialize(s = "0")
    raise ArgumentError, "Non-numeric character exists" if /[^0-9]/ =~ s

    @digit = Array.new(MAX_DIGIT, 0)

    s = s.sub(/^0+/, "").reverse

    if s.empty?
      # 0 と等しい場合
      @digit_num = 1
    else
      # 0 より大きい場合
      @digit_num = s.length
      raise OverflowError, "Given integer is too big" if @digit_num > MAX_DIGIT

      s.each_char.with_index {|c, i| @digit[i] = c.to_i}
    end
  end

  def to_s
    @digit[0..(@digit_num - 1)].reverse.join("")
  end

  def to_i
    result = 0
    d = 1

    @digit[0..(@digit_num - 1)].each_with_index do |x, i|
      result += x * d
      d *= 10
    end

    result
  end

  def +(bi)
    raise TypeError unless bi.is_a?(Bigint)

    new_digit = @digit.dup
    new_digit_num = [@digit_num, bi.digit_num].max

    add = lambda {
      rec = lambda {|i, x|
        return if x.zero?

        raise OverflowError, "Sum is too big" unless i < MAX_DIGIT

        new_digit_num = i + 1 unless i < new_digit_num

        result = new_digit[i] + x
        new_digit[i] = result % 10

        # 桁上り
        rec[i + 1, 1] if result > 9
      }
    }.call

    bi.digit_num.times do |i|
      add[i, bi.digit[i]]
    end

    new2(new_digit_num, new_digit)
  end

  protected
  def digit
    @digit
  end

  def digit=(d)
    @digit = d
  end

  def digit_num=(n)
    @digit_num = n
  end

  private
  def new2(digit_num, digit)
    that = Bigint.new

    that.digit_num = digit_num
    that.digit = digit

    that
  end

  class OverflowError < Exception
  end
end

n = gets.to_i
n.times do
  begin
    x = gets.chomp
    y = gets.chomp
    puts(Bigint.new(x) + Bigint.new(y))
  rescue Bigint::OverflowError
    puts "overflow"
  end
end
