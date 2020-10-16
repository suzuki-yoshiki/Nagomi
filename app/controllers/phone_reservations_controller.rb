class PhoneReservationsController < ApplicationController
  before_action :set_two_weeks,only: [:index, :edit]
  # before_action :authenticate_user!, only: [:edit, :update, :destroy, :new, :create]

  def index
  end

  def new
  end

  def create
    #必要だったら使う
    if current_user.nil? && current_staff.nil?
      flash[:danger] = "ログインしてください"
      redirect_to new_user_session_url and return
    end
    @phone_reservation = PhoneReservation.new(phone_reservation_params)
    if @phone_reservation.save! #予約ボタンを押されたら line_booked => true ,user_id => current_user.id となる
      flash[:success] = "#{l @phone_reservation.worked_on} #{@phone_reservation.line_time}のLINE電話予約が完了しました。"
      redirect_to phone_reservations_url and return
    else
      render :edit      
    end
  end

  def show
    #UserとPhoneReservationで親子関係を作りphone_reservationのline_booked: trueを持っているUserのレコードを取り出す
    @user = User.joins(:phone_reservations).group("users.id").where(phone_reservations: {line_booked: true}).paginate(page: params[:page], per_page: 3)
    # @users = User.all.paginate(page: params[:page], per_page: 5)
    @phone_reservations = PhoneReservation.where(line_booked: true).paginate(page: params[:page], per_page: 5)
    @phone_reservation_number = PhoneReservation.all #Line電話予約した場合
    # @finished_phone_users = 
  end

  def edit
    @phone_reservation = PhoneReservation.find(params[:id])
  end

  def update
    @phone_reservation = PhoneReservation.find(params[:id])
    if current_user.nil? && current_staff.nil?
      flash[:danger] = "ログインしてください"
      redirect_to new_user_session_url and return
    end
    if @phone_reservation.update_attributes(phone_reservation_params) #予約ボタンを押されたら line_booked => true ,user_id => current_user.id となる
      flash[:success] = "#{l @phone_reservation.worked_on} #{@phone_reservation.line_time}のLINE電話予約が完了しました。"
      redirect_to phone_reservations_url and return
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
