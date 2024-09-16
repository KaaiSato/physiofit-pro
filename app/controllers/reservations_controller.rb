class ReservationsController < ApplicationController
  before_action :authenticate_user_or_trainer!

  def new
    @reservation_address = ReservationAddress.new(trainer_id: params[:trainer_id])
  end

  def create
    @reservation_address = ReservationAddress.new(reservation_params)
    if @reservation_address.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
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

  def reservation_params
    params.require(:reservation_address).permit(:last_name, :first_name, :last_name_reading, :first_name_reading, :date, :time_id, :request, :prefecture_id, :city, :addresses, :phone_number, :trainer_id).merge(user_id: current_user.id)
  end
end
