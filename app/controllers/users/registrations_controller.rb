class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to after_sign_up_path_for(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  protected

  def after_sign_up_path_for(resource)
    user_root_path
  end

  def after_sign_in_path_for(resource)
    user_root_path
  end


  private

  def user_params
    params.require(:user).permit(:profile_image, :nickname, :email, :password, :password_confirmation, :age, :gender_id, :prefecture_id, :city, :profile)
  end
end

