class Users::ReservationsController < ApplicationController
  before_action :authenticate_user!, except: :index
  require "date"
  def index
    # @stylists = Stylist.all
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @ago = params.fetch(:ago,0).to_i
    @time = Date.today - @ago   
    @menus = Menu.all 
    params[:format]
  end

  def new
    # binding.pry
    @ago = params.fetch(:ago,0).to_i
    reservation_days
    salon_time
    @menu = Menu.find_by(id: params[:format])
    @day = Date.today - @ago
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @reservations = Reservation.all
  end

  def confirm
    # binding.pry
    salon_time
    @user = User.find_by(id: current_user.id)
    @menu = Menu.find_by(id: params[:format])
    @visit_time = params[:time]
    @visit_date = params[:date]
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @day = Date.today 
    # @menu_end_time = menu_end_time
  end
  
  def create
    # binding.pry
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      return redirect_to root_path
    else 
      render :index
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :menu_end_time, :menu_id, :menu_start_time, :salon_id, :set_price, :stylist_id, :time, :user_id)
  end
  
  def salon_time
    @salons = Salon.all
    @salons.each do |salon|
      @salon_start = salon.start_time
      @salon_end = salon.end_time
      @salon_id = salon.id
    end
  end
  def reservation_days
    @reservation_days = Reservation.all
    @reservation_days.each do |day| 
      @reservation_time = day.time
      @reservation_date = day.date
      @reservation_menu_start = day.menu_start_time
      @reservation_menu_end = day.menu_end_time
      
    end
  end
  # def menu_end_time
  #   option_check = false 
  #   @user.user_option.each do |option|
  #     if @menu.id == @user.user_option.menu_id && @user.id == @user.user_option.user_id
  #       option_check = true
  #     end
  #   end
  #   if option_check
  #      @visit_time.to_time + @menu.menu_time.sum - @user.user_option.menu_time.sum 
  #      option_check = false
  #   else  
  #       @visit_time.to_time + @menu.menu_time.sum 
  #   end 
  # end
end
