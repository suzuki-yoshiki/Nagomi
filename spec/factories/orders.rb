FactoryBot.define do
  factory :order do
    name { "MyString" }
    address { "MyString" }
    email { "MyString" }
    phone_number { "MyString" }
    user_id { 1 }
  end
end
