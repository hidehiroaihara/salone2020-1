class Admins::SalonsController < ApplicationController
  before_action :authenticate_admin!
  def index 
  end

  def new
    @salon = Salon.new
  end

  def create
    @salon = Salon.new(salon_params)
    if @salon.save
      return redirect_to admins_reservations_path
    else 
      render :new
    end
  end

  private

  def salon_params
    params.require(:salon).permit(:start_time, :end_time)
  end
end
