class Admins::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_reservation, only: [:show, :update, :edit, :destroy]
  before_action :set_wd
  before_action :admin_id
  def index
    @reservations = Reservation.includes(:user)
    @stylist = Stylist.all
    @ago = params.fetch(:ago,0).to_i
    @time = Date.today - @ago  
    salon_time
  end

  def destroy
    if @reservation.destroy
      redirect_to admins_reservations_path
    else 
      render :show
    end
  end

  

   private

  def salon_time
    @salons = Salon.all
    @salons.each do |salon|
      if salon.admin_id == current_admin.id
        @salon_start = salon.start_time
        @salon_end = salon.end_time
        @salon_id = salon.id
        @salon = salon
      end
    end
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_wd
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end
  
  def admin_id
    admins = Admin.all
    admins.each do |admin|
      @admin = admin
    end
  end
end
