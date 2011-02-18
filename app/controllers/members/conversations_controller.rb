class Members::ConversationsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @conversations = Conversation.all(:include => :comments, :order => 'comments.updated_at DESC').paginate :per_page => 10, :page => params[:page]
  end
  
  def show
    @conversation = Conversation.find(params[:id])
    @conversation.views += 1
    @conversation.save
    @conversation    
    @comment = Comment.new
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
    @conversation.user_id = @comment.user_id = current_user.id

    respond_to do |format|
      if @conversation.save      
        User.for_forum_notification.each do |u|
          Notifier.send_member_new_forum_post(u, @conversation).deliver unless @comment.user_id = u.id
        end        
        format.html { redirect_to(members_forum_path, :notice => 'Your Post was successfully created') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  # POST /members/forum/reply
  def save_reply
    @conversation = Conversation.find(params[:id])
    @comment = @conversation.comments.build(params[:comment])
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to(members_forum_post_path(@conversation.id), :notice => 'Reply was successfully posted') }
      else
        format.html { render :action => "show", :id => @conversation.id }
      end
    end
  end
  
  # GET /members/forum/edit/:id
  def edit
    c = Comment.find(params[:id])
    @conversation = c.conversation
    @comment = c
  end
  
  # PUT /members/forum/edit/:id
  def update
    @comment = Comment.find(params[:id])    
    @conversation = @comment.conversation

    if @comment.update_attributes(params[:comment]) && (params[:conversation].nil? || @conversation.update_attributes(params[:conversation]))
      redirect_to(members_forum_post_path(@conversation.id), :notice => 'Reply was successfully updated') 
    else
      render :action => "edit", :id => params[:id] 
    end
    
  end
  
end