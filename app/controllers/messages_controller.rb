class MessagesController < ApplicationController
  before_action :authenticate_user_or_trainer!
  before_action :set_chat

  def index
    @messages = @chat.messages.includes(:chat).order(:created_at)
    @message = @chat.messages.new
  end

  def create
    @message = @chat.messages.new(message_params)
    if trainer_signed_in?
      @message.sender = current_trainer
    else
      @message.sender = current_user
    end

    if @message.save
      respond_to do |format|
        format.html { redirect_to chat_messages_path(@chat) }
        format.js
      end
    else
      render :index
    end
  end

  private

  def authenticate_user_or_trainer!
   if trainer_signed_in?
     authenticate_trainer!
   else
     authenticate_user!
   end
 end

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end