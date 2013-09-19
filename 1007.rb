# AOJ 1007 JPEG Compression

$RIGHT = 0
$DOWN = 1
$LEFT_BELOW = 2
$RIGHT_ABOVE = 3

def scan(n)
  m = Array.new(n) {Array.new(n)}
  x = y = 0
  prev_dir = $RIGHT_ABOVE

  (1..(n * n)).each do |i|
    m[y][x] = i

    case prev_dir
    when $RIGHT
      if y.zero?
        x -= 1
        y += 1
        prev_dir = $LEFT_BELOW
      elsif y == n - 1
        x += 1
        y -= 1
        prev_dir = $RIGHT_ABOVE
      end
    when $DOWN
      if x.zero?
        x += 1
        y -= 1
        prev_dir = $RIGHT_ABOVE
      elsif x == n - 1
        x -= 1
        y += 1
        prev_dir = $LEFT_BELOW
      end
    when $LEFT_BELOW
      if y == n - 1
        x += 1
        prev_dir = $RIGHT
      elsif x.zero?
        y += 1
        prev_dir = $DOWN
      else
        x -= 1
        y += 1
      end
    when $RIGHT_ABOVE
      if x == n - 1
        y += 1
        prev_dir = $DOWN
      elsif y.zero?
        x += 1
        prev_dir = $RIGHT
      else
        x += 1
        y -= 1
      end
    end
  end

  m.each do |row|
    puts row.map {|v| "%3d".%(v)}.join("")
  end
end

i = 0
while true
  i += 1
  n = gets.to_i
  break if n.zero?

  puts "Case #{i}:"
  scan(n)
end
