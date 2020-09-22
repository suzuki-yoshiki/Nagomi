class PhoneReservationsController < ApplicationController
  before_action :set_two_weeks,only: [:index, :edit]
  # before_action :authenticate_user!,　only: [:edit, :update, :destroy, :new, :create]

  def index
    @phone_reservation = PhoneReservation.all
    # @phone_reservation = PhoneReservation.find(params[:id])
  end

  def new
  end

  def create
  end

  def show
    day = PhoneReservation.find(params[:id]).worked_on
    @phone_reservation = PhoneReservation.where(worked_on: day , line_time:params[:time])
    debugger
  end

  def edit
    day = PhoneReservation.find(params[:id]).worked_on
    @phone_reservation = PhoneReservation.find_by(worked_on: day ,line_time: params[:time])
  end

  def update
    @phone_reservation = PhoneReservation.find(params[:id])
    if @phone_reservation.update_attributes(phone_reservation_params)
      flash[:success] = "LINE電話予約が完了しました。"
      redirect_to phone_reservations_url
    else
      debugger
      render :edit      
    end
  end

  def destroy
  end

  private

  def phone_reservation_params
    params.require(:phone_reservation).permit(:line_booked)
  end
  

end
