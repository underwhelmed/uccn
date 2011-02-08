class Members::ConversationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @conversations = Conversation.all
  end
  
  def show
    @conversations = Conversation.find(params[:id])
    @conversations.views += 1
    @conversations.save
    @conversations
  end
  
  def new
    @conversation = Conversation.new
    @comment = @conversation.comments.build

    respond_to do |format|
      format.html # new.html.erb
    end
  end
  
  def create
    @conversation = Conversation.new(params[:conversation])
    @conversation.views = 0
    @comment = @conversation.comments.build(params[:comment])
    @conversation.user_id  = @comment.user_id = current_user.id

    respond_to do |format|
      if @conversation.save
        format.html { redirect_to(members_forum_path, :notice => 'Your Post was successfully created') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
end