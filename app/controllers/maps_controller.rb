class MapsController < ApplicationController
  def index
    @map = Map.find(1)
  end

  def new
  end

  def edit
    @map = Map.find(1)
  end

  def update
    @map = Map.find(1)
    @map.update_attributes(map_params)
    if @map.save
      flash[:success] = "所在地のデータを更新しました。"
      redirect_to maps_url
    else
      render :edit      
    end
  end

  private

    def map_params
      params.require(:map).permit(:address, :distance, :time )
    end
end
