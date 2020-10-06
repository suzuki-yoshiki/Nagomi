# coding: utf-8
#管理者ユーザー
Staff.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             admin: true)

#サンプルユーザー             
User.create!(name: "Sample-1 User",
             email: "sample-1@email.com",
             password: "password",
             password_confirmation: "password",
             admin: false)

#サンプルスタッフ            
Staff.create!(name: "Sample Staff",
              email: "sample-staff@email.com",
              password: "password",
              password_confirmation: "password")


Map.create!(address: "静岡駅")
