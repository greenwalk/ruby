# 1000000までの数字で、各桁を掛け算する計算を積が１桁になるまで繰り返す。ちょうど6回で計算が終わるものの数。
array = []

(1..1000000).each do |i|
  n = 0
  while i.to_s.length > 1 do
    i = i.digits.inject(:*)
    n += 1
  end
  # 計算終了回数によってカウント。array[n]が空だったら、1を代入して、中に何か入ってたらそれ＋１を代入
  array[n] = (array[n] || 0) + 1
end

puts array[6]
