class Users::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy] 
  before_action :admin_id
  def index
    salon_all
    @stylists = Stylist.limit(14).order("created_at DESC")
    status_update
  end

  def show
    salon_all
    @wd = ["日", "月", "火", "水", "木", "金", "土"]
  end

  def edit
    salon_all
    @user_address_detail = UserAddressDetail.new(first_name: @user.first_name, last_name: @user.last_name, first_name_cana: @user.first_name_cana, last_name_cana: @user.last_name_cana, phone_number: @user.phone_number, email: @user.email,  post_code: @user.address.post_code, prefecture_id: @user.address.prefecture_id, address_all: @user.address.address_all, gender_id: @user.user_detail.gender_id, blood_id: @user.user_detail.blood_id, job_id: @user.user_detail.job_id, consent_id: @user.user_detail.consent_id, stylist_id: @user.stylist.id, birthday: @user.birthday)
  end

  def update
    @user_address_detail = UserAddressDetail.new(user_params)
    if @user_address_detail.save_update(params[:id])
       redirect_to users_user_path
    else
      render :edit 
    end
  end

  def destroy
    @user_address_detaail = UserAddressDetail.new
    if @user_address_detail.user_destroy(params[:id])
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def user_params
    params.require(:user_address_detail).permit(:first_name, :last_name, :first_name_cana, :last_name_cana, :phone_number, :email, :post_code, :prefecture_id, :address_all, :gender_id, :blood_id, :job_id, :consent_id, :stylist_id, :salon_id, :admin_id).merge(birthday: set_birthday)
  end

  def salon_all
    @salons = Salon.all 
    @salons.each do |salon|
      @salon = salon
    end
  end

  def set_birthday
    Date.new(params.require(:user_address_detail).require("birthday(1i)").to_i,params.require(:user_address_detail).require("birthday(2i)").to_i,params.require(:user_address_detail).require("birthday(3i)").to_i)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  def status(menu_end_time)
    if (DateTime.now.strftime("%Y%m%d%H%M")).to_i < menu_end_time.strftime("%Y%m%d%H%M").to_i
      return 1
    elsif (DateTime.now.strftime("%Y%m%d%H%M")).to_i > menu_end_time.strftime("%Y%m%d%H%M").to_i
      return 3
    end
  end
  
  def status_update
    reservations = Reservation.all
    reservations.each do |reservation|
      reservation.status_id = status(reservation.menu_end_time)
      reservation.save
    end
  end

  def admin_id
    admins = Admin.all
    admins.each do |admin|
      @admin = admin
    end
  end
end
