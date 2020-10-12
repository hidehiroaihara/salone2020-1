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
    @ago = params.fetch(:ago,0).to_i
    reservation_days
    salon_time
    @menu = Menu.find_by(id: params[:format])
    @day = Date.today 
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
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
    binding.pry
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      return redirect_to root_path
    else 
      render :index
    end
  end
    # :stylist_id, :time, :menu_start_time, :date, :menu_id, :user_id, :salon_id, :set_price, :menu_end_time]
  #   unless @user.valid?
  #     flash.now[:alert] = @user.errors.full_messages
  #     render :new and return
  #   end
  #   session["devise.regist_data"] = {user: @user.attributes}
  #   session["devise.regist_data"][:user]["password"] = params[:user][:password]
  #   @address = @user.build_address
  #   render :new_address
  # end

  # def create_address
  #   @user = User.new(session["devise.regist_data"]["user"])
  #   @address = Address.new(address_params)
  #   unless @address.valid?
  #     flash.now[:alert] = @address.errors.full_messages
  #     render :new_address and return
  #   end
  #   @user.build_address(@address.attributes)
  #   session["address"] = @address.attributes
  #   @detail = @user.build_user_detail
  #   render :new_detail
  # end
  

  private
  def reservation_params
    params.require(:reservation).permit(:date, :menu_end_time, :menu_id, :menu_start_time, :salon_id, :set_price, :stylist_id, :time, :user_id)
  end
  
  # def new_reservation
  #   params[:menu_id]
  #   params[:menu_name]
  #   params[:menu_name]
  #   params[:customer_type_id]
  # end
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
      @resrvation_time = day.time
      @resevation_date = day.date
      @reseravtion_menu_start = day.menu_start_time
      @reservation_menu_end = day.menu_end_time
    end
  end
  def menu_end_time
    @visit_time.to_time + @menu.menu_time.sum
  end
end
