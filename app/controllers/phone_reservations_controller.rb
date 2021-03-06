class PhoneReservationsController < ApplicationController
  before_action :set_two_weeks,only: [:index, :edit]
  #before_action :authenticate_user!, only: [:edit, :update, :destroy]

  def index
  end

  def index_holidays #Line電話予約の休みの一覧
    @phone_reservations = PhoneReservation.where(holiday: true)
  end

  def update_holidays #Line電話予約の休みの更新
    @phone_reservation = PhoneReservation.find(params[:id]) 
    @phone_reservation.update_attributes(holiday: false)
    redirect_to index_holidays_phone_reservations_url
  end

  def index_users  #Line電話予約した人の一覧ページ
    @phone_reservations = PhoneReservation.where(line_booked: true).where(line_end: false) 
  end

  def update_index_users #Line電話予約した人の完了or削除
    @phone_reservation = PhoneReservation.find(params[:id])
    if params[:commit] == "完了"
      @phone_reservation.update_attributes(line_end: true)
      flash[:success] = "#{l @phone_reservation.worked_on} #{@phone_reservation.line_time}のLine電話を完了しました！お疲れ様です！"
    else params[:commit] == "削除"
      @phone_reservation.update_attributes(line_booked: false)
      flash[:danger] = "#{l @phone_reservation.worked_on} #{@phone_reservation.line_time}のLine電話を削除しました！"
    end
      redirect_to work_reservations_url
  end

  def old_index_users #LINE電話履歴
    @phone_reservations = PhoneReservation.where(line_booked: true).where(line_end: true) 
  end
  
  def edit #モーダル画面
    @phone_reservation = PhoneReservation.find(params[:id])
  end

  def show
    @phone_reservations = PhoneReservation.where(line_booked: true).where(line_end: false).where(user_id: current_user)
  end

  def update
    @phone_reservation = PhoneReservation.find(params[:id])
    if current_user.nil? && current_staff.nil?
      flash[:danger] = "ログインしてください"
      redirect_to new_user_session_url and return
    end
    if @phone_reservation.update_attributes(phone_reservation_params) #予約ボタンを押されたら line_booked => true ,user_id => current_user.id となる
      if current_user.present?
        if params[:phone_reservation][:line_booked] = true
        flash[:success] = "#{l @phone_reservation.worked_on} #{@phone_reservation.line_time}のLINE電話予約が完了しました。"
        redirect_to phone_reservations_url and return
        end
      elsif current_staff.present?
        if params[:phone_reservation][:holiday] = true 
        flash[:success] = "#{l @phone_reservation.worked_on} #{@phone_reservation.line_time}を休みにしました。"
        redirect_to phone_reservations_url and return
        end
      end
    else
      render :edit      
    end
  end

  def destroy
  end

  private

  def phone_reservation_params
    params.require(:phone_reservation).permit(:line_booked, :user_id ,:holiday, :staff_id) #予約ボタンを押されたら line_booked => true ,user_id => current_user.id となる
  end
  
end
