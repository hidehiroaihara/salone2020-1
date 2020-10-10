class Users::ReservationsController < ApplicationController
  before_action :authenticate_user!, except: :index
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
    @menu = Menu.find_by(id: params[:format])
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Rservation.new()
  end
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
    params.require(:resevation).permit(:stylist_id)
  end
  # def new_reservation
  #   params[:menu_id]
  #   params[:menu_name]
  #   params[:menu_name]
  #   params[:customer_type_id]
  # end
end
