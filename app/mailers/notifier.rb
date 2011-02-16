class Notifier < ActionMailer::Base
  default :from => "no-reply@uccn.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.user_feedback.subject
  #
  def user_feedback(message)
    @greeting = message

    mail :to => "irishpeg@comcast.net"
  end
  
  def send_member_emails(to, reply_to, subject, body)
    @body = body
    mail :to => to, :subject => subject, :reply_to => reply_to
  end
end
