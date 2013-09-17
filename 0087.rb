# AOJ 0087 Strange Mathematical Expression

def calc(s)
  data = s.split
  stack = []

  data.each do |d|
    case d
    when /\d+/
      stack.push d.to_f
    when "+"
      x, y = stack.pop(2)
      stack.push(x + y)
    when "-"
      x, y = stack.pop(2)
      stack.push(x - y)
    when "*"
      x, y = stack.pop(2)
      stack.push(x * y)
    when "/"
      x, y = stack.pop(2)
      stack.push(x / y)
    end
  end

  stack.pop
end

while line = gets
  line.chomp!
  puts calc(line)
end
