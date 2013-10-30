# AOJ 0036 A Figure on Surface

$WIDTH = $HEIGHT = 8

class Map
  FIGURES = {
    A: [
              [0, 1],
      [1, 0], [1, 1]
    ],
    B: [
      [1, 0],
      [2, 0],
      [3, 0]
    ],
    C: [
      [0, 1], [0, 2], [0, 3]
    ],
    D: [
      [1, -1], [1, 0],
      [2, -1]
    ],
    E: [
      [0, 1],
      [1, 1], [1, 2]
    ],
    F: [
      [1, 0], [1, 1],
              [2, 1]
    ],
    G: [
                       [0, 1],
      [1, -1], [1, 0]
    ]
  }

  def initialize(lines)
    @map = Array.new($HEIGHT + 4) {Array.new($WIDTH + 4, -1)}

    lines.each.with_index(1) do |row, i|
      row.each_char.with_index(1) do |c, j|
        @map[i][j] = c.to_i
      end
    end

    @figures = Hash[
      FIGURES.map {|name, cells| [name, figure?(cells)]}
    ]
  end

  def determine_figure
    (1..$HEIGHT).each do |i|
      (1..$WIDTH).each do |j|
        if @map[i][j] == 1
          @figures.each do |name, det|
            return name if det[i, j]
          end
        end
      end
    end

    nil
  end

  private
  # その形状であるかを返す lambda を返す。
  # 返された lambda には基準となる位置の i, j を渡す。
  #
  # [cells]
  # 1 でなければならない相対位置 [i_r, i_j] の配列
  def figure?(cells)
    lambda {|i, j|
      cells.map {|i_r, j_r| @map[i + i_r][j + j_r]}.all? {|v| v == 1}
    }
  end
end

while line = gets
  line.chomp!
  next if line.empty?

  lines = [line]
  ($HEIGHT - 1).times do
    lines << gets.chomp
  end

  puts Map.new(lines).determine_figure
end
