class Users::ReservationsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :move_to_index
  require "date"
  def index
    # binding.pry
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @ago = params.fetch(:ago,0).to_i
    @time = Date.today - @ago   
    @menus = Menu.all 
    params[:format]
    @user = User.find_by(id: current_user.id)
    # begin
    #   selected_menu_ids = selected_menus_params
    #   filtered_list_ids = Menu.filter(selected_menus_ids)
    #   @lists = StyleCategoryList.where(id :filtered_lists_ids)
    # rescue
    #   redirect_to root_path
  end

  def new
    # binding.pry
    @ago = params.fetch(:ago,0).to_i
    reservation_days
    salon_time
    @menu = Menu.find_by(id: params[:format])
    @day = DateTime.now - @ago
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @reservations = Reservation.all
    @date = Date.today
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
    @menu_end_time = menu_end_time
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
  
  # def selected_menus_params
  #   params.require(:menu_ids)

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

  def menu_end_time
    option_check = false
    @user_option = UserOption.all
    @user_option.each do |option|
      if @menu.id == option.menu_id && @user.id == option.user_id 
        @user_time = option.menu_time
        option_check = true
      end
    end
      if option_check
         @visit_time.to_time + @menu.menu_time.sum - @user_time.sum 
      else 
         @visit_time.to_time + @menu.menu_time.sum 
      end 
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
