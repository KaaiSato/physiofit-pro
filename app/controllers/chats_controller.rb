class ChatsController < ApplicationController
  before_action :authenticate_user_or_trainer!
  before_action :set_chat, only: [:show]

  def index
    if trainer_signed_in?
      @chats = current_trainer.chats.includes(:user)
    elsif user_signed_in?
      @chats = current_user.chats.includes(:trainer)
    end
  end

  def show
    @message = Message.new
    @messages = @chat.messages.includes(:chat).order(:created_at)
  end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def authenticate_user_or_trainer!
    if trainer_signed_in?
      authenticate_trainer!
    elsif user_signed_in?
      authenticate_user!
    else
      redirect_to root_path
    end
  end

end
