class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
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
end
