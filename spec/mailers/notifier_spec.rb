require "spec_helper"

describe Notifier do
 
  describe "user_feedback" do
    let(:mail) { Notifier.user_feedback("Hi") }

    it "renders the headers" do
      mail.subject.should eq("Feedback from the UCCN website")
      mail.to.should eq(["irishpeg@comcast.net"])
      #mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
    
  end

end
