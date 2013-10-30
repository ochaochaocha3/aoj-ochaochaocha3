# AOJ 0031 Weight

weights = [1, 2, 4, 8, 16, 32, 64, 128, 256, 512]
while line = gets
  w_obj = line.to_i
  puts weights.select {|w| w & w_obj > 0}.join(" ")
end
