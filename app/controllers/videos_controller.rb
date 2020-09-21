class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video = Video.new(video_params)
    url = params[:video][:youtube_url]
    url = url.last(11) #Youtubeのurlの下11文字を取得する
    @video.body = url
    if @video.save
      flash[:success] = '新規作成に成功しました。'
      redirect_to videos_url
    else
      render :new
    end
  end

  def show
  end

  def edit
    @video = Video.find(params[:id])
  end

  def update
    @video = Video.find(params[:id])
    @video.update_attributes(video_params)
    url = params[:video][:youtube_url]
    url = url.last(11) #Youtubeのurlの下11文字を取得する
    @video.body = url
    if @video.save
      flash[:success] = "#{@video.title}のデータを更新しました。"
      redirect_to videos_url
    else
      render :edit      
    end
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    flash[:success] = "#{@video.title}のデータを削除しました。"
    redirect_to videos_url
  end

  private

    def video_params
      params.require(:video).permit(:title, :youtube_url)
    end

end
