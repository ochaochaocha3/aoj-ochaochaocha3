# AOJ 0026 Dropping Ink

class Paper
  WIDTH = 10
  HEIGHT = 10

  module DropSize
    SMALL = 1
    MEDIUM = 2
    LARGE = 3
  end

  def initialize
    @density = Array.new(HEIGHT) {Array.new(WIDTH, 0)}
  end

  def drop_ink(xc, yc, size)
    cells = []

    case size
    when DropSize::SMALL
      cells << [xc - 1, yc]
      cells << [xc, yc - 1]
      cells << [xc, yc]
      cells << [xc, yc + 1]
      cells << [xc + 1, yc]
    when DropSize::MEDIUM
      ((xc - 1)..(xc + 1)).each do |x|
        ((yc - 1)..(yc + 1)).each do |y|
          cells << [x, y]
        end
      end
    when DropSize::LARGE
      ((xc - 1)..(xc + 1)).each do |x|
        ((yc - 1)..(yc + 1)).each do |y|
          cells << [x, y]
        end
      end
      cells << [xc - 2, yc]
      cells << [xc, yc - 2]
      cells << [xc, yc + 2]
      cells << [xc + 2, yc]
    end

    cells.each {|x, y| inc_density(x, y)}
  end

  def n_white_cells
    @density.map {|row| row.select {|d| d.zero?}.length}.reduce(0, :+)
  end

  def max_density
    @density.map {|row| row.max}.max
  end

  private
  def inc_density(x, y)
    if x >= 0 && x < WIDTH && y >= 0 && y < HEIGHT
      @density[y][x] += 1
    end
  end
end

paper = Paper.new
while line = gets
  xc, yc, size = line.split(",").map {|v| v.to_i}
  paper.drop_ink(xc, yc, size)
end

puts paper.n_white_cells
puts paper.max_density
