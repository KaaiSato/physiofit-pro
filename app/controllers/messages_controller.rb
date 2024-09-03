class MessagesController < ApplicationController
  before_action :authenticate_user_or_trainer!
 
  def create
    @chat = Chat.find(params[:chat_id])
    @message = @chat.messages.new(message_params.merge(sender: current_user_or_trainer))

    if @message.save
      sender_profile_image = @message.sender.is_a?(Trainer) ? @chat.trainer.profile_image : @chat.user.profile_image
      sender_profile_image_url = url_for(sender_profile_image) if sender_profile_image.attached?

      ActionCable.server.broadcast "message_channel", {
        message: render_message(@message),
        sender_type: @message.sender_type,
        content: @message.content,
        sender_profile_image_url: sender_profile_image_url
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

  def render_message(message)
    MessagesController.render(partial: 'messages/message', locals: { message: message })
  end

  def current_user_or_trainer
    current_user || current_trainer
  end
end