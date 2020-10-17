class UserMailer < ApplicationMailer
  default from: 'Nagomi@example.com'

  def welcome_email(work_reservation)
    @url  = 'https://nagomi-system.herokuapp.com/staffs/sign_in'
    @work_reservation = work_reservation
    mail(to: @work_reservation.user.email, subject: "予約確定のお知らせ")
  end
end
