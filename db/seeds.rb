# coding: utf-8
#管理者ユーザー
Staff.create!(name: "管理者Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)

#サンプルスタッフ            
Staff.create!(name: "Sample Staff",
   email: "sample-staff@email.com",
   password: "password",
   password_confirmation: "password")

40.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  Staff.create!(name: name,
                email: email,
                password: password,
                password_confirmation: password)
end        
                
puts "Staff Created"

#サンプルユーザー             
User.create!(name: "お客様Sample User",
             email: "sample1@email.com",
             password: "password",
             password_confirmation: "password",
             admin: false)

40.times do |n|
name  = Faker::Name.name
email = "sample-#{n+1}@email.com"
password = "password"
User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password)
end        

puts "User Created"

Item.create!(name: "ー部屋掃除８畳以上",
             price: "15000")

Item.create!(name: "ー部屋掃除6畳以上",
             price: "12000")

Item.create!(name: "キッチンクリーニング",
             price: "15000")

Item.create!(name: "レンジフードクリーニング",
             price: "12000")

Item.create!(name: "浴室クリーニング",
             price: "17000")

Item.create!(name: "窓ガラスクリーニング（内側のみ）",
             price: "5000")

Item.create!(name: "エアコンクリーニング",
             price: "8000")

Item.create!(name: "冷蔵庫クリーニング",
             price: "5000")

Item.create!(name: "電子レンジクリーニング",
             price: "3000")

Item.create!(name: "トイレクリーニング",
             price: "10000") 

Item.create!(name: "洗面所クリーニング",
             price: "10000")

Item.create!(name: "洗濯機クリーニング",
             price: "5000")

Item.create!(name: "棚づくり",
             price: "10000") 
             
Item.create!(name: "玄関清掃",
             price: "10000")

Item.create!(name: "外まわり清掃",
             price: "12000")

puts "Item Created"

# WorkReservation.create!(main_menu: "ー部屋掃除８畳以上")

# WorkReservation.create!(main_menu: "ー部屋掃除6畳以下")

# WorkReservation.create!(min_menu: "レンジフードクリーニング")

# WorkReservation.create!(main_menu: "キッチンクリーニング")

# WorkReservation.create!(main_menu: "風呂場")

# WorkReservation.create!(option_menu: "窓ガラス内側のみクリーニング")

# WorkReservation.create!(option_menu: "エアコンはフィルターまで行います")

# WorkReservation.create!(option_menu: "洗濯機は洗剤を入れて６０分")

# WorkReservation.create!(option_menu: "冷蔵庫クリーニング")

# WorkReservation.create!(option_menu: "電子レンジクリーニング")

# WorkReservation.create!(option_menu: "棚づくり")
                        
# WorkReservation.create!(option_menu: "玄関")

# WorkReservation.create!(option_menu: "トイレ")

# WorkReservation.create!(option_menu: "洗面所")

# WorkReservation.create!(option_menu: "庭")


puts "WorkReservation Created"


Map.create!(address: "伊豆急下田駅")

puts "Map Created"