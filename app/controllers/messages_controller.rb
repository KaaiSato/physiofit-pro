class MessagesController < ApplicationController
  before_action :authenticate_user_or_trainer!
 
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params.merge(sender: current_user_or_trainer))

    if @message.save
      ActionCable.server.broadcast "message_channel", {message: render_message(@message)}
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

  def message_params
    params.require(:message).permit(:content)
  end

  def render_message(message)
    MessagesController.render(partial: 'messages/message', locals: { message: message })
  end

  def current_user_or_trainer
    current_user || current_trainer
  end
end