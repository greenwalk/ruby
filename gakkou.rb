def registration_student(students)
  # 生徒の名前と年齢を登録できるようにしなさい
  student = {}
  puts '生徒名を入力してください'
  name = gets.chomp
  puts '生徒の年齢を入力してください'
  age = gets.to_i

  student = {name: name, age: age}

  # 登録した生徒の国語、数学、英語の点数を登録できるようにしなさい
  score = {}
  puts "国語の得点は？"
  japanese = gets.to_i
  puts "数学の得点は？"
  math = gets.to_i
  puts "英語の得点は？"
  english = gets.to_i

  score = {japanese: japanese, math: math, english: english}
  student[:score] = score
  students << student
end

def show_student_name(students)
  # 登録された生徒の名前を番号を振って表示しなさい
  students.each_with_index do |student, i|
    puts "#{i+1}: #{student[:name]}"
  end
  puts '見たい生徒の番号を入力してください'
  num = gets.to_i
  student = students[num - 1]
  score = student[:score]
  # 選択された生徒の名前、年齢、国語、数学、英語の点数を表示できるようにしなさい
  puts "名前:#{student[:name]}"
  puts "年齢:#{student[:age]}"
  puts "国語:#{student[:score][:japanese]}"
  puts "数学:#{student[:score][:math]}"
  puts "英語:#{student[:score][:english]}"
end

students = []

while true
  puts '行いたい項目を選択してください'
  puts '[1]点数を登録する'
  puts '[2]点数を確認する'
  puts '[3]終了する'
  input = gets.to_i
  if input == 1
    registration_student(students)
  elsif input == 2
    show_student_name(students)
  elsif input == 3
    exit
  else
    puts '無効な値です'
  end
end