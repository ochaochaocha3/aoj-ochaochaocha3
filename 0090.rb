# AOJ 0090 Overlaps of Seals

$EPS = 1e-9

class CircleR1
  attr_reader :center

  def initialize(center)
    @center = center
  end

  def to_s
    "#<CircleR1 (#{@center.real},#{@center.imag})>"
  end

  def include?(point)
    (point - @center).abs2 <= 1 + $EPS
  end

  def overlaps?(other)
    (other.center - @center).abs2 <= 4
  end

  def intersection_points(other)
    return [] unless overlaps?(other)

    d = (other.center - @center).abs
    e1 = (other.center - @center) / d
    e2 = e1 * Complex(0, 1)
    l1 = 0.5 * d
    l2 = Math.sqrt(1 - l1 * l1)

    p1 = @center + l1 * e1 + l2 * e2
    p2 = @center + l1 * e1 - l2 * e2

    l2 < $EPS ? [p1] : [p1, p2]
  end
end

while line = gets
  n = line.to_i
  break if n.zero?

  circles = []
  intersection_points = []
  n.times do
    x, y = gets.split(",").map(&:to_f)
    c1 = CircleR1.new(Complex(x, y))

    # これまでにある円との交点を求め、交点の配列に追加する
    circles.each do |c2|
      intersection_points += c1.intersection_points(c2)
    end

    circles << c1
  end

  max_overlaps = 1
  intersection_points.each do |point|
    overlaps = circles.select {|circle| circle.include?(point)}.length
    max_overlaps = [overlaps, max_overlaps].max
  end

  puts max_overlaps
end
