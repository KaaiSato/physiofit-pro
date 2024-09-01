class ReservationsController < ApplicationController
  before_action :authenticate_user_or_trainer!

  def index
  end

  def new
  end

  def create
  end

  private

  def authenticate_user_or_trainer!
    if trainer_signed_in?
      authenticate_trainer!
    else
      authenticate_user!
    end
  end
 

end
