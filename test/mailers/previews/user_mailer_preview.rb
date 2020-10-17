# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def welcome_email(user)
    user = User.new(name: "侍 太郎", email: user.email)
   
    UserMailer.send_mail(user)
  end

end
