class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email
    @url  = 'https://nagomi-system.herokuapp.com/staffs/sign_in'
    @work_reservation = params[:work]
    mail(to: @work_reservation.user.email, subject: "予約確定のお知らせ")
  end
end
