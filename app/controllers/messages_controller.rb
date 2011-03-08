class MessagesController < ApplicationController
  
  def new
    @message = Message.new
  end
  
  def create    
    @message = Message.new(params[:message])   
    if @message.save
      Notifier.user_feedback(@message).deliver
      redirect_to contact_success_path, :notice => 'Thanks for your feedback!'
    else
      flash[:notice] =  "Unable to send your message, please fill out the form in its entirety and click SEND. Make sure that all required fields (marked with an asterisk) are filled in."
      render "new"
    end
  end
  
  def success
    
  end
  
end