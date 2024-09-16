class TrainersController < ApplicationController
  def index
    @reservations = Reservation.where(trainer_id: current_trainer.id)
  end
  
  def show
    @trainer = Trainer.find(params[:id])  
  end



  private
  
  def after_sign_in_path_for(resource)
    trainer_root_path
  end

end
