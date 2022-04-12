
def register(data)
  puts "車種を入力してください"
  category = gets.chomp
  puts "1Lあたりの走行可能距離(km/l)を入力してください"
  nenpi = gets.to_f
  puts "乗車定員を入力してください"
  capacity = gets.to_i

  car = {category: category, nenpi: nenpi, capacity: capacity}
  data << car
end
def show_data(data)
  puts "見たい車種の番号を入力してください"
  data.each_with_index do |car, i|
    puts "#{i}: #{car[:category]}"
  end
  
  while true do
    choice = gets.to_i
    if choice <= (data.length - 1) && choice >= 0
      select_car = data[choice]
      break
    else
      puts "無効な数字です 再度入力してください"
    end
  end

  puts "車種: #{select_car[:category]}"  
  puts "燃費: #{select_car[:nenpi]}(km/l)"
  puts "乗車人数: #{select_car[:capacity]}人"
    
  cal_gas(select_car)
end

def cal_gas(car)
  puts "走行予定距離(km)を入力してください"
  how_far = gets.to_f
  need_gas = how_far / car[:nenpi]
  puts "この#{car[:category]}で#{how_far}(km)走行するにはガソリンが#{need_gas.round(2)}(l)必要です。"

  cal_how_many_people(car)
end

def cal_how_many_people(car)
  puts "乗車する人数を入力してください"
  people = gets.to_i
  if people > car[:capacity]
    puts "定員は#{car[:capacity]}です。#{people - car[:capacity]}人オーバーしています。"
  elsif people == car[:capacity]
    puts "定員ぴったりです！これ以上は乗らないでね。"
  else
    puts "定員は#{car[:capacity]}です。あと#{car[:capacity] - people}人まで乗車可能です。"
  end
end

data = []
while true do
  
  puts "以下の選択肢の番号を入力してください"
  puts "[0]データの登録"
  puts "[1]データの確認"
  puts "[2]プログラムの終了"

  input = gets.to_i

  if input == 0
    register(data)
  elsif input == 1
    show_data(data)
  elsif input == 2
    exit
  else
    puts "無効な数値です"
  end
end