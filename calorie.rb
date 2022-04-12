while true do
  puts "[0]:カロリーを表示する、[1]:終了する"
  select_num = gets.to_i
  if select_num == 0
    puts '500kcal'
  elsif select_num == 1
    break
  end
end