class Admins::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @stylists = Stylist.all
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @ago = params.fetch(:ago,0).to_i
    @time = Time.now - @ago  
   end
end
