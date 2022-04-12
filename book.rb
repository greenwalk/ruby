def register_book(books)
  # 本の著者、タイトル、価格をユーザーに入力させ、保存する
  puts '著者を入力してください'
  author = gets.chomp
  puts 'タイトルを入力してください'
  title = gets.chomp
  puts '価格を入力してください'
  price = gets.to_i
  
  book = { author: author, title: title, price: price }
  books << book
end

def show_price_average(books)
  price_total = 0
  books.each do |book|
    price_total += book[:price]
  end
  price_average = price_total / books.length
  puts "平均価格:#{price_average}円"

  show_books(books)
end

def show_books(books)
  puts "見たい番号を入力してください"
  # 保存された本の一覧を出力する
  books.each_with_index do |book, i|
    puts "#{i}:#{book[:title]}"
  end
  book_num = gets.to_i
  select_book = books[book_num]
  show_detail(select_book)
end

def show_detail(book)
  # 選択された本の詳細な情報（著者、タイトル、価格）を出力する
  puts "著者 #{book[:author]}"
  puts "タイトル #{book[:title]}"
  puts "価格 #{book[:price]}円"
end

books = []
while true do
  puts "番号を入力してください"
  puts "0: 本を登録する"
  puts "1: 本の一覧を見る"
  puts "2: 終了する"
  case gets.to_i
  when 0
    # 本の登録を行う
    register_book(books)
  when 1
    # 保存された本の一覧を出力する
    show_price_average(books)
  when 2
    exit
  else
    puts '無効な値です'
  end
end