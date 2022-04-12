us = {}

(1..1000000).each do |i|
  n = 0
  while i.to_s.length > 1 do
    i = i.to_s.split('').map(&:to_i).inject(:*)
    n += 1
  end
  us[n] = (us[n] || 0) + 1
end

p us
# {0=>9, 1=>248, 2=>340, 3=>310, 4=>84, 5=>9}
p us[6]