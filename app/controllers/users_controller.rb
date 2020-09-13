class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def new
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to users_url
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end

  def edit_reservation_status
    @day = Date.parse.strftime(params[:day])
    @work_reservations = WorkReservation.where.not(worked_on: nil).where(worked_on: @day)
    @users = User.all
  end

   def new_work_reservation
    @user = User.find(params[:id])
   end

  private

    def user_params
      params.require(:user).permit(:name, :kana, :sex, :email, :phone_number, :password, :password_confirmation)
    end

end
