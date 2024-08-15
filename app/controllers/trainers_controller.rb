class TrainersController < ApplicationController
  def index
  
  end

  private
  
  def after_sign_in_path_for(resource)
    trainer_root_path
  end

end
