class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  $days_of_the_week = %w{日 月 火 水 木 金 土}

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation, :kana, :sex, :address, :phone_number, :line_id ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def after_sign_in_path_for(resource) #deviseでログイン後のリダイレクト先を指定
    case resource
     when Staff
       work_reservation_path(resource)
     when User
      if current_user.admin?
       work_reservation_path(resource) #adminの場合管理者ページへ
      else
       phone_reservations_path(resource) #その他ユーザーは最初のページへ。後ほど社員の場合も作る必要があるのかも？
      end
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def set_two_weeks
    if params[:date].nil?
      require 'date'
      @first_day = Date.today
      @last_day = (@first_day+13.day)
    else
      @first_day = params[:date].to_date
      @last_day = (@first_day+13.day)
    end
    @two_weeks = [*@first_day..@last_day] # 対象の週の日数を代入
    @phone_reservations = PhoneReservation.where(worked_on: @first_day..@last_day)
    unless @two_weeks.count == @phone_reservations.count
      ActiveRecord::Base.transaction do
        @two_weeks.each { |day| PhoneReservation.create!(worked_on: day) }  
      end
       @phone_reservations = PhoneReservation.where(worked_on: @first_day..@last_day)  
    end

    rescue ActiveRecord::RecordInvalid
      flash[:danger] = "ページ情報の取得に失敗しました、再アクセスしてください。"
      redirect_to root_url
  end

  def set_day_time
    @day_time = [ "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00" ]
  end
end
