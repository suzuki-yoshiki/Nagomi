class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end

  def after_sign_in_path_for(resource) #deviseでログイン後のリダイレクト先を指定
    if current_user.admin?
     work_reservation_path(resource) #adminの場合管理者ページへ
    else
     root_path(resource) #その他ユーザーは最初のページへ。後ほど社員の場合も作る必要があるのかも？
    end
  end

  def set_two_weeks
    @first_day = Date.today
    @last_day = @first_day.since(14.days)
    @two_weeks = [*@first_day..@last_day]
    @times = [11,12,13,14,15,16,17]

    @two_weeks.each do |day|
      unless PhoneReservation.where(worked_on: day).present?
        @times.each do |time|
          PhoneReservation.create(worked_on: day, line_time: time)
        end
      end
    end

    @phone_reservations = PhoneReservation.where(worked_on: @first_day..@last_day)
    id = @phone_reservations.first.id
    last_id = id + 13
    @ids = [*id..last_id]
  end
end
