line = gets.split(' ')

r = line[0]
s = line[1]
dir = line[2]
show_hh = line[3].to_i

a_u_time = [0,3,5,2,3,4,3,4,2,2,3,6,2]
a_d_time = [0,2,6,3,2,2,4,3,4,3,2,5,3]
b_u_time = [0,4,3,3,2,3]
b_d_time = [0,3,2,3,3,4]
mms = []
hhs = []

# an駅上りについて
if r == "A" && dir == "U"
  # a線各駅上りの始発時間
  a1_start = "05:55"
  start_time_hh = a1_start.slice(0..1).to_i
  start_time_mm = a1_start.slice(3..4).to_i
  a_u_start_time = []
  a_u_time.each_with_index do |start_time, i|
    if (start_time_mm + start_time) % 60 < start_time_mm
      start_time_hh += 1
    end
    start_time_mm = (start_time_mm + start_time) % 60
    if i == 6
      if (start_time_mm + 5) % 60 < start_time_mm
        start_time_hh += 1
      end
      start_time_mm = (start_time_mm + 5) % 60
    end
    a_u_start_time << sprintf("%02d",start_time_hh).to_s + ":" + sprintf("%02d",start_time_mm).to_s
  end

  # 初期値
  s_num = s[1..-1].to_i
  hh = a_u_start_time[s_num - 1].slice(0..1).to_i
  mm = a_u_start_time[s_num - 1].slice(3..4).to_i

  # 時刻表計算
  # n=1..6
  if s_num <= 6
    while hh < 23 do
      mms = [sprintf("%02d", hh)+":"]
      while mm < 60 do
        mms << sprintf("%02d",mm)
        mm += 5
      end
        mm = mm%60
      hhs << mms
      hh += 1
    end


  # n=7..13
  else
    start_time_7to13 = [10, 14, 12, 14, 17, 23, 25]
    while hh < 23 do
      if hh == 6
        mms << start_time_7to13[s_num - 7]
      end
      mms = [sprintf("%02d", hh)+":"]
      while mm < 60 do
        mms << sprintf("%02d",mm)
        mm += 10
      end
        mm = mm%60
      hhs << mms
      hh += 1
    end
  end
  
# bn駅上りについて
elsif r == "B" && dir == "U"
  # b線各駅上りの始発時間
  b1_start = "06:00"
  b_start_time_hh = b1_start.slice(0..1).to_i
  b_start_time_mm = b1_start.slice(3..4).to_i
  b_u_start_time = []
  b_u_time.each do |start_time|
    if (b_start_time_mm + start_time) % 60 < b_start_time_mm
      start_time_hh += 1
    end
    b_start_time_mm = (b_start_time_mm + start_time) % 60
    b_u_start_time << sprintf("%02d",b_start_time_hh).to_s + ":" + sprintf("%02d",b_start_time_mm).to_s
  end

  # 初期値
  if s == "A7"
    s_num = 6
  end
  s_num = s[1..-1].to_i
  hh = b_u_start_time[s_num - 1].slice(0..1).to_i
  mm = b_u_start_time[s_num - 1].slice(3..4).to_i

  # 時刻表計算
  while hh < 23 do
    mms = [sprintf("%02d", hh)+":"]
    while mm < 60 do
      mms << sprintf("%02d",mm)
      mm += 6
    end
      mm = mm%60
    hhs << mms
    hh += 1
  end

# an駅下りについて
elsif r == "A" && dir == "D"
  # a線各駅下りの始発時間
  a13_start = "05:52"
  a_d_start_time_hh = a13_start.slice(0..1).to_i
  a_d_start_time_mm = a13_start.slice(3..4).to_i
  a_d_start_time = []
  a_d_time.each_with_index do |start_time, i|
    if (a_d_start_time_mm + start_time) % 60 < a_d_start_time_mm
      a_d_start_time_hh += 1
    end
    a_d_start_time_mm = (a_d_start_time_mm + start_time) % 60
    if i == 6
      a_d_start_time_mm = (a_d_start_time_mm - 5) % 60
    end
    a_d_start_time << sprintf("%02d",a_d_start_time_hh).to_s + ":" + sprintf("%02d",a_d_start_time_mm).to_s
  end

  # 初期値
  s_num = s[1..-1].to_i
  hh = a_d_start_time[13 - s_num].slice(0..1).to_i
  mm = a_d_start_time[13 - s_num].slice(3..4).to_i

  # 時刻表計算
  # n=13..8
  if s_num >= 8
    while hh < 23 do
      mms = [sprintf("%02d", hh)+":"]
      while mm < 60 do
        mms << sprintf("%02d",mm)
        mm += 10
      end
        mm = mm%60
      hhs << mms
      hh += 1
    end
  # n=7..1
  else
    while hh < 23 do
      mms = [sprintf("%02d", hh)+":"]
      while mm < 60 do
        mms << sprintf("%02d",mm)
        mm += 5
      end
        mm = mm%60
      hhs << mms
      hh += 1
    end
    hhs[-1].delete_at(-1)
  end

# bn駅下りについて
elsif r == "B" && dir == "D"
  # b線各駅下りの始発時間
  ba7_start = "06:11"
  ba7_start_time_hh = ba7_start.slice(0..1).to_i
  ba7_start_time_mm = ba7_start.slice(3..4).to_i
  ba7_d_start_time = []
  b_d_time.each do |start_time|
    if (ba7_start_time_mm + start_time) % 60 < ba7_start_time_mm
      ba7_start_time_hh += 1
    end
    ba7_start_time_mm = (ba7_start_time_mm + start_time) % 60
    ba7_d_start_time << sprintf("%02d",ba7_start_time_hh).to_s + ":" + sprintf("%02d",ba7_start_time_mm).to_s
  end
  puts ba7_d_start_time

  # 初期値
  if s == "A7"
    s_num = 6
  end
  s_num = s[1..-1].to_i
  hh = ba7_d_start_time[6 - s_num].slice(0..1).to_i
  mm = ba7_d_start_time[6 - s_num].slice(3..4).to_i

  # 時刻表計算
  while hh < 23 do
    mms = [sprintf("%02d", hh)+":"]
    while mm < 60 do
      mms << sprintf("%02d",mm)
      mm += 6
    end
      mm = mm%60
    hhs << mms
    hh += 1
  end
end

show_hh_array = []
hhs.each_with_index do |hh, i|
  if (show_hh.to_i == hh[0].slice(0..1).to_i) && hh.size >= 2
    show_hh_array = hh
  end
end

if show_hh_array.size == 0
  puts "No train"
else
  puts show_hh_array.join(" ")
end