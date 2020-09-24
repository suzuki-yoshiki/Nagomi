class PhoneReservationsController < ApplicationController
  before_action :set_two_weeks,only: [:index, :edit]
  # before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    @phone_reservation = PhoneReservation.find(params[:id])
  end

  def update
    @phone_reservation = PhoneReservation.find(params[:id])
    if @phone_reservation.update_attributes(phone_reservation_params) #予約ボタンを押されたら line_booked => true ,user_id => current_user.id となる
      flash[:success] = "#{l @phone_reservation.worked_on} #{@phone_reservation.line_time}のLINE電話予約が完了しました。"
      redirect_to phone_reservations_url
    else
      render :edit      
    end
  end

  def destroy
  end

  private

  def phone_reservation_params
    params.require(:phone_reservation).permit(:line_booked, :user_id ) #予約ボタンを押されたら line_booked => true ,user_id => current_user.id となる
  end
  

end
