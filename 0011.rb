# AOJ 0011 Drawing Lots
# あみだくじ

w = ARGF.gets.to_i

n = ARGF.gets.to_i
exchanges = []

n.times do
  exchanges << ARGF.gets.split(",").map {|x| x.to_i}
end

amida = []
(1..w).each do |from|
  to = from
  exchanges.each do |f, t|
    if to == f
      to = t
    elsif to == t
      to = f
    end
  end

  amida << {from: from, to: to}
end

amida.sort_by {|a| a[:to]}.each {|a| puts a[:from]}
