def day_sale(line1, line2, lines)
  a = line1[0]
  b = line1[1]
  c = line1[2]
  d = line1[3]
  n = line2
  price = 0
  total_price = 0
  n.times do |i|
    ti = lines[i][0]
    ti_hour = ti.slice(0..1).to_i
    li = lines[i][1].to_i
    if (li -a) % c == 0
      price = b + d * (li - a)/c
    else
      price = b + d * ((li - a)/c + 1)
    end

    if ti_hour >= 22
      price *= 1.2
      price = price.floor
    end
    total_price += price
  end
  return total_price
end

line1 = gets.split(' ').map(&:to_i)
line2 = gets.to_i
lines = $stdin.readlines(chomp: true).map{|line| line.split(' ')}
puts day_sale(line1, line2, lines)