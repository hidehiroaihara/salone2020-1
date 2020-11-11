class Admins::SalonDetailsController < ApplicationController
  before_action :set_salon
  def index
    @date = Date.today 
  end
  
  def new_regular
    @salon_detail = SalonDetail.new
  end

  def create_regular
    @salon_detail = SalonDetail.new(regular_params)
    if @salon_detail.save
      redirect_to admins_salon_salon_details_path(current_admin.salon.id)
    else
      render :new_regular
    end
  end
  
  def new_spcial
    @salon_detail = SalonDetail.new
    @date_mouth = params[:date]
  end

  def create_spcial
    @salon_detail = SalonDetail.new(spcial_params)
    if @salon_detail.save
      redirect_to admins_salon_salon_details_path(current_admin.salon.id)
    else
      render :new_spcial
    end
  end

  def new
    @salon_detail = SalonDetail.new
  end

  private

  def regular_params
    params.require(:salon_detail).permit({regular_holiday_ids: []}).merge(salon_id: current_admin.salon.id)
  end

  def spcial_params
    params.require(:salon_detail).permit(spcial_holiday_ids: []).merge(salon_id: current_admin.salon.id)
  end

  def set_salon
    @salon = Salon.find(params[:salon_id])
  end
end
