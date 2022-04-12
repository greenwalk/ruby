sum = 0
40001.times do |i|
  i_s = i.to_s
  if i % 3 == 0 || i_s.include?("3")
    sum += i
  end
end

puts sum