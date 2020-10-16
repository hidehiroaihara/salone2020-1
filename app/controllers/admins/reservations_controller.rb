class Admins::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @reservations = Reservation.includes(:user)
    @stylist = Stylist.all
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @ago = params.fetch(:ago,0).to_i
    @time = Time.now - @ago  
    salon_time
  end

   private

  def salon_time
    @salons = Salon.all
    @salons.each do |salon|
      @salon_start = salon.start_time
      @salon_end = salon.end_time
      @salon_id = salon.id
    end
  end
end
