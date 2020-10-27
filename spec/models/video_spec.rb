require 'rails_helper'

RSpec.describe Video, type: :model do
  describe '#create' do
    before do
      @video = FactoryBot.build(:video)
    end

    it 'titleが存在していないと保存できないこと' do
      @video.title = ""
      @video.valid?
      expect(@video.errors.full_messages).to include('タイトルを入力してください')
    end

    it 'YoutubeURLが存在していないと保存できないこと' do
      @video.youtube_url = ""
      @video.valid?
      expect(@video.errors.full_messages).to include('YoutubeのURLを入力してください')
    end
  end
end
