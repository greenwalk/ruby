# 1^4+2^4+3^4+...+50^4
sum = 0

50.times do |i|
  sum += (i + 1)**4
end

puts sum