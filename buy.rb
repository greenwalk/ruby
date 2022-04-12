def post_item(cart)
  # 商品名・値段・個数の入力を促し、入力された値をハッシュオブジェクトで管理する
    puts "商品名を入力してください："
    name = gets.chomp
    puts "値段を入力してください："
    price = gets.to_i
    puts "個数を入力してください："
    num = gets.to_i

    line = "---------------------------"
    puts "#{line}"
  # 入力された値（ハッシュオブジェクトで管理している値）と合計金額を表示する
    total = price * num
    puts "商品名 : #{name} "
    puts "値段 : #{price} "
    puts "個数 : #{num} "
    puts "合計金額 : #{total} "
    puts "#{line}"
  # ハッシュを配列オブジェクトに追加する
  item = {name: name, price: price, num: num, total: total}
  cart << item
  # a_cartをメソッドの呼び出し元に返す
  return cart
  end
  
  def check_items(cart)
  # 保存された全ての商品情報（商品名・値段・個数）を、商品ごとに表示する
    cart_total = 0
    cart.each do |item|
      puts "#{item[:name]}  ¥#{item[:price]}"
      puts "個数 : #{item[:num]}"
      cart_total = cart_total + (item[:price] * item[:num])
    end
  # 全ての商品の合計金額を表示する
    puts "合計金額 : ¥#{cart_total}"
    line = "---------------------------"
    puts "#{line}"
    puts "[0]購入を確定する [1]買い物を続ける"
    input = gets.to_i
    if input == 0
      ab_buy(cart_total)
    elsif input == 1
    else
    end
  end

  def ab_buy(cart_total)
    puts "合計金額#{cart_total}"
    
    re_pay = true

    while re_pay do
      puts "支払い金額を入力してください"
      pay = gets.to_i
      if cart_total <= pay
        puts "お釣り : ¥#{pay - cart_total}"
        re_pay = false
      else
        puts "金額が不足しています"
        re_pay = true
      end
    end
  end

  def end_program
    # プログラムを終了させる
    exit
  end
  
  def exception
    puts "入力された値は無効な値です"
  end
  
  cart = []             # 配列オブジェクトcartの生成
  
  while true do
  # メニューの表示
    puts "商品数: #{cart.length}"
    puts "[0]商品をカートに入れる"
    unless cart.empty?       #カートに商品がない場合、[1]は選択不可
      puts "[1]カートを確認する"
    end
    puts "[2]アプリを終了する"
    input = gets.to_i
  
    if input == 0 then
      cart = post_item(cart)  # post_itemメソッドを呼び出す記述
    elsif input == 1 then
      check_items(cart) # check_itemsメソッドを呼び出す記述
    elsif input == 2 then
      end_program     # end_programメソッドを呼び出す記述
    else
      exception           # exceptionメソッドを呼び出す記述
    end
  end