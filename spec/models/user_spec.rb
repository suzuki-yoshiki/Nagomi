require 'rails_helper'

RSpec.describe User, type: :model do

   it "ファクトリーボットが有効である事" do
      expect(FactoryBot.build(:user)).to be_valid
   end

   it "名前、メールアドレス、パスワードがあれば有効な状態である" do
     user = User.new(
     name: "Sample",
     email: "sample@email.com",
     password: "password",
     )
     expect(user).to be_valid
   end

   it "名前が無ければ無効" do
     user = FactoryBot.build(:user, name: nil)
     user.valid?
     expect(user.errors[:name]).to include(I18n.t('errors.messages.blank'))
   end

   it "メールアドレスが無ければ無効" do
     user = FactoryBot.build(:user, email: nil)
     user.valid?
     expect(user.errors[:email]).to include(I18n.t('errors.messages.blank'))
   end

   it "重複した’メールアドレスなら無効" do
     FactoryBot.create(:user, email: "sample@email.com")
     user = FactoryBot.build(:user, email: "sample@email.com")
     user.valid?
     expect(user.errors[:email]).to include(I18n.t('errors.messages.taken'))
   end
end
