class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @user = User.find(params[:id])
    @url  = 'https://nagomi-system.herokuapp.com/staffs/sign_in'
    mail(to: @user.email, subject: '予約確定のお知らせ')
  end
end
