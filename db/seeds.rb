# coding: utf-8
#管理者ユーザー
Staff.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)

#サンプルスタッフ            
Staff.create!(name: "Sample Staff",
              email: "sample-staff@email.com",
              password: "password",
              password_confirmation: "password")

puts "Staff Created"

#サンプルユーザー             
User.create!(name: "Sample-1 User",
             email: "sample-1@email.com",
             password: "password",
             password_confirmation: "password",
             admin: false)

puts "User Created"

WorkReservation.create!(main_menu: "ー部屋掃除８畳以上",
                        option_menu: "窓ガラス内側のみクリーニング")

WorkReservation.create!(main_menu: "ー部屋掃除6畳以下",
                        option_menu: "エアコンはフィルターまで行います")

WorkReservation.create!(main_menu: "レンジフードクリーニング",
                        option_menu: "洗濯機は洗剤を入れて６０分")

WorkReservation.create!(main_menu: "キッチンクリーニング",
                        option_menu: "電化製品")
  
WorkReservation.create!(main_menu: "風呂場",
                        option_menu: "棚づくり")
  
WorkReservation.create!(option_menu: "玄関")

WorkReservation.create!(option_menu: "トイレ")
    
WorkReservation.create!(option_menu: "洗面所")
    
WorkReservation.create!(option_menu: "庭")
  

puts "WorkReservation Created"


Map.create!(address: "静岡駅")

puts "Map Created"

