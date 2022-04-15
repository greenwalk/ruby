# 1/1+1/2+...+1/nが何回目で12を超えるか
sum = 0
num = 0
10000000.times do |i|
  sum += (1.0/(i + 1.0)).to_f
  num = i + 1
  if sum > 12
    break
  end
end

puts num