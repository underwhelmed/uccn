class UserMailer < ActionMailer::Base
  default :from => "no-reply@uccn.org"
  
  def welcome_email(user)
    @user = user
    @url = 'http://www.uccn.org'
    mail(:to =>user.email, :subject => "Welcome to the UCCN")
  end
end
