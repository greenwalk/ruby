def register_data(datas)
  puts "名前を入力してください"
  name = gets.chomp
  puts '年齢を入力してください'
  age = gets.to_i
  puts '身長(m単位)を入力してください'
  height = gets.to_f
  puts '体重(kg単位)を入力してください'
  weight = gets.to_f

  data = { name: name, age: age, height: height, weight: weight, bmi: cal_bmi(height, weight) }
  datas << data
end

def cal_bmi(height, weight)
  return bmi = weight / (height * height)
end

def show_data(datas)
  puts '見たい人の番号を選択してください'
  datas.each_with_index do |data, i|
    puts "#{i+1}:#{data[:name]}"
  end
  choice = gets.to_i
  data = datas[choice - 1]
  puts "名前:#{data[:name]}"
  puts "年齢:#{data[:age]}"
  puts "身長:#{data[:height]}"
  puts "体重:#{data[:weight]}"
  puts "BMI:#{data[:bmi]}"
end

datas = []
while true
  puts "選択してください"
  puts "[0]登録する"
  puts "[1]データを確認する"
  puts "[2]終了する"
  input = gets.to_i

  if input == 0
    # データの登録と出力するための関数を呼ぶ
    register_data(datas)
  elsif input == 1
    # データの確認と出力するための関数を呼ぶ
    show_data(datas)
  elsif input == 2
    # アプリケーションを終了させる
    exit
  else
    puts "無効な値です"
  end
end