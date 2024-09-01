class MessagesController < ApplicationController
  before_action :authenticate_user_or_trainer!
 
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params.merge(sender: current_user_or_trainer))

    if @message.save
      sender_profile_image = @message.sender.is_a?(Trainer) ? @message.chat.trainer.profile_image : @message.chat.user.profile_image
      ActionCable.server.broadcast "message_channel", {
      message: render_message(@message),
      sender_type: @message.sender_type,
      content: @message.content,
      sender_profile_image: sender_profile_image
      }
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

  def current_user_or_trainer
    current_user || current_trainer
  end
end