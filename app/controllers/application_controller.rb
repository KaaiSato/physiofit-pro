class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.is_a?(Trainer)
      trainer_root_path  # Trainerの場合はtrainer_root_pathにリダイレクト
    elsif resource.is_a?(User)
      user_root_path  # Userの場合はuser_root_pathにリダイレクト
    else
      super  # デフォルトのリダイレクト先
    end
  end

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :nickname,
        :email,
        :age,
        :gender_id,
        :prefecture_id,
        :city,
        :profile
      ])
      devise_parameter_sanitizer.permit(:account_update, keys: [
        :nickname,
        :email,
        :age,
        :gender_id,
        :prefecture_id,
        :city,
        :profile
      ])
    elsif resource_class == Trainer
      devise_parameter_sanitizer.permit(:sign_up, keys: [
        :nickname,
        :email,
        :last_name,
        :first_name,
        :last_name_reading,
        :first_name_reading,
        :age,
        :sex_id,
        :prefecture_id,
        :city,
        :registration_number,
        :career,
        :profile,
        :latitude,
        :longitude,
        :service_radius_km
      ])
      devise_parameter_sanitizer.permit(:account_update, keys: [
        :nickname,
        :email,
        :last_name,
        :first_name,
        :last_name_reading,
        :first_name_reading,
        :age,
        :sex_id,
        :prefecture_id,
        :city,
        :registration_number,
        :career,
        :profile,
        :latitude,
        :longitude,
        :service_radius_km
      ])
    end
  end

  private
  
  def render_message(message)
   ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
  end
  
end