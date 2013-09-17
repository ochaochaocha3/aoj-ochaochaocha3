# AOJ 0001 List of Top 3 Hills

heights = ARGF.each_line.map {|line| line.to_i}.sort.reverse
heights[0..2].each {|height| puts height}
