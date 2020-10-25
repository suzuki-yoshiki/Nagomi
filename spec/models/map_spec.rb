require 'rails_helper'

RSpec.describe Map, type: :model do
  describe '#create' do
    before do
      @map = FactoryBot.build(:map)
    end

    it 'addressが存在していないと保存できないこと' do
      @map.address = ""
      @map.valid?
      expect(@map.errors.full_messages).to include('住所を入力してください')
    end
  end
end
