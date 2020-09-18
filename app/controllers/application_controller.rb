class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana, :sex, :email, :address, :phone_number, :line_id, :password, :password_confirmation]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end

  def after_sign_in_path_for(resource) #deviseでログイン後のリダイレクト先を指定
    if current_user.admin?
     work_reservation_path(resource) #adminの場合管理者ページへ
    else
     phone_reservation_path(resource) #一般ユーザーは電話予約ののページへ。後ほど社員の場合も作る。
    end
  end
end
