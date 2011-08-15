class Notifier < ActionMailer::Base
  default :from => "no-reply@uccn.org"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.user_feedback.subject
  #
  def user_feedback(message)
    @message = message
    mail :to => "irishpeg@comcast.net", :reply_to => message.email
  end
  
  def send_member_emails(to, subject, reply_to, body)
    @message = body
    mail :to => to, :subject => subject, :reply_to => reply_to
  end
  
  def send_member_new_forum_post(user, conversation)
    @user = user
    @conversation = conversation
    mail :to => user.email, :subject => "New UCCN Forum Post"
  end
  
  def send_new_membership_application(membership)
    @membership = membership
    mail :to => 'barb-peterson@sbcglobal.net', :subject => "New UCCN Membership Application Request"
  end
  
end
