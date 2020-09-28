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
        phone_reservation_path(resource) #その他ユーザーは最初のページへ。後ほど社員の場合も作る必要があるのかも？
      end
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def set_two_weeks
    if params[:date].nil? # 前の週、次の週に対応
      require 'date'
      @first_day = Date.today
      @last_day = (@first_day+13.day)
    else
      @first_day = params[:date].to_date
      @last_day = (@first_day+13.day)
    end
    @two_weeks = [*@first_day..@last_day] # 対象の週の日数を代入
    @day_time = [ 0,1,2,3,4,5,6 ] # 時間の配列を作成
    @two_weeks.each do |day| # 表示するデータが存在すること保証
      unless PhoneReservation.where(worked_on: day).present?
        @day_time.each do |time|
          PhoneReservation.create(worked_on: day, line_time: time)
        end
      end    

      @phone_reservations = PhoneReservation.where(worked_on: @first_day) # 一番最初のデータを取得
      id1 = @phone_reservations.first.id
      id2 = id1 + 7
      id3 = id2 + 7
      id4 = id3 + 7
      id5 = id4 + 7
      id6 = id5 + 7
      id7 = id6 + 7
      id8 = id7 + 7
      id9 = id8 + 7
      id10 = id9 + 7
      id11 = id10 + 7
      id12 = id11+ 7
      id13 = id12+ 7
      id14 = id13+ 7
      @ids = [id1,id2,id3,id4,id5,id6,id7,id8,id9,id10,id11,id12,id13,id14] # idの配列を作成

      @count = (@first_day.end_of_month - @first_day).to_i + 1
    end
  end
end
