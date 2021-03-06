class Admins::SalonsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_salon, only: [:edit, :show, :update, :destroy]
  before_action :admin_id
  def index 
    @salons = Salon.all
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
  
  def update
    if @salon.update(salon_params)
      redirect_to admins_salons_path
    else
      render :edit
    end
  end
  private

  def salon_params
    params.require(:salon).permit(:start_time, :end_time, :salon_name, :salon_name_cana, :post_code, :prefecture_id, :address_all, :salon_slogan, :salon_info, :salon_top_image, :salon_bottom_image).merge(admin_id: current_admin.id)
  end

  def set_salon
    @salon = Salon.find(params[:id])
  end

  def admin_id
    admins = Admin.all
    admins.each do |admin|
      @admin = admin
    end
  end

end
