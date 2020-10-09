class Users::ReservationsController < ApplicationController
  before_action :authenticate_user!, except: :index
  def index
    # @stylists = Stylist.all
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
    @ago = params.fetch(:ago,0).to_i
    @time = Date.today - @ago   
  end

  def new
    @Reservation = Reservation.new
    @menus = Menu.all 
    # @menus = Menu.includes(:style_category_list)
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
end
