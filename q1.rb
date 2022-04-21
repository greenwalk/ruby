# 1234567890の10000000以下の約数の和
n = 1234567890

ary = []
sum = 0
10000000.times do |i|
  if n % (i + 1) == 0 && (i + 1)
    sum += (i + 1)
  end
end

puts sum