class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

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
end
