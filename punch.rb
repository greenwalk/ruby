def register_data(data)
  # 「登録する」を選択した場合の処理
  puts "名前を入力してください"
  name = gets.chomp
  puts "パンチ力を入力してください(0 ~ 100)"
  punch = no_100_over(gets.to_i)
  puts "キック力を入力してください(0 ~ 100)"
  kick = no_100_over(gets.to_i)
  puts "ジャンプ力を入力してください(0 ~ 100)"  
  jump = no_100_over(gets.to_i)

  hero_power = punch + kick + jump

  person = {name: name, punch: punch, kick: kick, jump: jump, hero_rank: hero_rank(hero_power)}
  data << person
end

def no_100_over(power)
  while power > 100
    puts '100以下の数字を入力してください'
      power = gets.to_i
  end
  return power
end

def hero_rank(hero_power)
  if hero_power >= 270
    hero_rank = 'A'
  elsif hero_power >= 210
    hero_rank = 'B'
  elsif hero_power >= 150
    hero_rank = 'C'
  else
    hero_rank = 'D'
  end

  return hero_rank
end
 
def show_data_list(data)
  # 「データを確認する」を選択した場合の処理
  puts "見たい人の番号を選択してください"
  data.each_with_index do |person, i|
    puts "#{i+1}: #{person[:name]}"
  end
  choice = gets.to_i
  person = data[choice - 1]
  puts "名前: #{person[:name]}"
  puts "パンチ力: #{person[:punch]}"
  puts "キック力: #{person[:kick]}"
  puts "ジャンプ力: #{person[:jump]}"
  puts "ヒーローランク: #{person[:hero_rank]}"
end

  data = []
while true
  # アプリを実行した時に、選択肢が表示される処理
  puts "選択してください"
  puts "[0]登録する"
  puts "[1]データを確認する"
  puts "[2]終了する"
  input = gets.to_i
  # 入力した値に応じて実行される処理
  if input == 0
    register_data(data)
  elsif input == 1
    show_data_list(data)
  elsif input == 2
    exit
  else
    puts "無効な値です"
  end
end