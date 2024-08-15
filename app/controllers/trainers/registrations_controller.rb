class Trainers::RegistrationsController < ApplicationController
  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)
    if @trainer.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def after_sign_in_path_for(resource)
    trainer_root_path
  end

  def trainer_params
    params.require(:trainer).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_reading, :first_name_reading, :age, :gender_id, :prefecture_id, :city, :registration_number, :career, :profile)
  end
end