# AOJ 0002 Digit Number

sums = ARGF.each_line.map {|line| line.split(" ").map {|x| x.to_i} \
                           .reduce(0, :+)}
sums.map {|s|
  if s.zero?
    1
  else
    Math.log10(s).to_i + 1
  end
}.each {|d| puts d}
