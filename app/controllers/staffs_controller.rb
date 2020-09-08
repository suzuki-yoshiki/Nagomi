class StaffsController < ApplicationController
  
  def index
    @staffs = Staff.all
  end

  def new
  end

  def show
  end

  def edit
    @staff = Staff.find(params[:id])
  end

  def update
    @staff = Staff.find(params[:id])
    if @staff.update_attributes(staff_params)
      flash[:success] = "スタッフ情報を更新しました。"
      redirect_to staffs_url
    else
      render :edit      
    end
  end

  def destroy
    @staff = Staff.find(params[:id])
    @staff.destroy
    flash[:success] = "#{@staff.name}のデータを削除しました。"
    redirect_to staffs_url
  end

  def create
  end

  private

    def staff_params
      params.require(:staff).permit(:staff_number, :name, :kana, :sex, :email, :phone_number, :password, :password_confirmation)
    end
end
