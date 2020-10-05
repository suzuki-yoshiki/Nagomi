class MapsController < ApplicationController
  def index
    @map = Map.find(1)
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.find(1)
    @map1 = Map.new(map_params)
    if @map1.save
      if @map1.distance_to(@map) < @map.distance
        flash[:success] = '対応可能です'
        redirect_to maps_index_url
      else
        flash[:danger] = '対応不可です'
        redirect_to maps_index_url
      end
    else
      render :new
    end
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
