require "spec_helper"

describe Notifier do
 
  describe "user_feedback" do
    message = Message.new :name => "Person", :email => "user@example.com", :body => "Hi"
    let(:mail) { Notifier.user_feedback(message) }

    it "renders the headers" do
      mail.subject.should eq("Feedback from the UCCN website")
      mail.to.should eq(["irishpeg@comcast.net"])
      mail.from.should eq(["no-reply@uccn.org"])
      mail.reply_to.should eq(["user@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
    
  end
  
  describe "New Forum Post Notification" do
    conversation = Conversation.new
    comment = conversation.comments.build
    user = User.new
    user.first_name = "This"
    user.last_name = "Poster"
    comment.user = user
    conversation.id = 4
    conversation.title = "Testing"
    u = User.new
    u.first_name = "Testing"
    u.last_name = "User"
    
    let(:mail) {Notifier.send_member_new_forum_post(u, conversation)}
    
    it "renders the body with the correct url" do
      host = ActionMailer::Base.default_url_options[:host]
      mail.body.encoded.should match(%r{<a href=\"http://#{host}/members/forum/view/#{conversation.id}">})
    end
  end

end
