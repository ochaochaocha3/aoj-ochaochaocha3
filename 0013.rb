# AOJ 0013 Switching Railroad Cars

rail_tracks = []

while line = gets
  n = line.to_i
  if n > 0
    rail_tracks.push n
  elsif n.zero?
    puts rail_tracks.pop
  end
end
