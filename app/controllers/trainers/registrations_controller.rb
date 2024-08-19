class Trainers::RegistrationsController < Devise::RegistrationsController
  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      sign_in(@trainer)
      redirect_to after_sign_up_path_for(@trainer)
    else
      render :new, status: :unprocessable_entity
    end
  end

  protected

  def after_sign_up_path_for(resource)
    trainer_root_path
  end

  def after_sign_in_path_for(resource)
    trainer_root_path
  end


  private

  def trainer_params
    params.require(:trainer).permit(:profile_image, :nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_reading, :first_name_reading, :age, :gender_id, :prefecture_id, :city, :registration_number, :career, :profile)
  end
end
