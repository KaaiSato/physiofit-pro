class ChatsController < ApplicationController
  before_action :authenticate_user_or_trainer!
  before_action :set_chat, only: [:show]

  def index
    if trainer_signed_in?
      @chats = current_trainer.chats.includes(:user,:trainer)
    elsif user_signed_in?
      @chats = current_user.chats.includes(:trainer,:user)
    end

    Rails.logger.debug "Fetched chats: #{@chats.inspect}"
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    @messages = @chat.messages.includes(:chat).order(:created_at)
  end

  def create
    @trainer = Trainer.find(params[:trainer_id])
    @chat = Chat.find_or_create_by(user: current_user, trainer: @trainer)

    if @chat.persisted?
      redirect_to chat_path(@chat)
    else
      redirect_to root_path, alert: "チャットの作成に失敗しました"
    end
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
