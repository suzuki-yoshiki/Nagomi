class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
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
      if current_staff.present?
        work_reservations_path(resource)        #社員がログインしたら作業予約状況ページへ
      else
        flash[:danger] = "ログインしてください"
        root_path(resource)                     #ログインしてなかったらトップページへ戻る
      end
    when User
      if current_user.present?
        phone_reservations_path(resource) #Userの場合Line電話予約受付ページへ
      else
        flash[:danger] = "ログインしてください"
        root_path(resource) #その他ユーザーは最初のページへ
      end
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def set_two_weeks
    if params[:date].nil? # 前の週、次の週に対応
      require 'date'
      @first_day = Date.tomorrow
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

  protect_from_forgery with: :exception #セッション情報を元に、現在のカートを呼び出すことができるようになる

  helper_method :current_cart

  def current_cart
    if session[:cart_id]
      # セッションから取得したcart_idを元にCartテーブルからCart情報を取得
      @cart = Cart.find_by(id: session[:cart_id])
    else
      # Cart情報が存在しない場合、@cartを作成
      @cart = Cart.create
      # 取得したCart情報よりIDを取得し、セッションに設定
      session[:cart_id] = @cart.id
    end
     @cart = Cart.find(session[:cart_id])
     rescue ActiveRecord::RecordNotFound
     @cart = Cart.create
     session[:cart_id] = @cart.id
     @cart
  end

  # 現在ログインしているユーザーを許可します。(マイアカウントで使用)
  def admin_or_correct_user
    @user = User.find(params[:id]) if @user.blank?
    unless current_user?(@user)
      flash[:danger] = "他のお客様のアカウントページには移動できません。"
      redirect_to show_account_user_url(current_user)
    end  
  end
  # 管理権限者、または現在ログインしているスタッフを許可します。(マイアカウントで使用)
  def admin_or_correct_staff
    @staff = Staff.find(params[:id]) if @staff.blank?
    unless current_staff.admin? || current_staff?(@staff)
      flash[:danger] = "他のスタッフのアカウントページには移動できません。"
      redirect_to show_account_staff_url(current_staff)
    end  
  end

#ログインしているユーザーは見ることができない
  def no_current_user
    if current_user.present?
      flash[:danger] = "スタッフのみ見ることができるページです。"
      redirect_to phone_reservations_url(current_user)
    end
  end
end