# AOJ 0050 Apple and Peach

puts ARGF.read.gsub(/apple|peach/, {"apple" => "peach", "peach" => "apple"})
