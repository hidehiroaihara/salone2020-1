class Admins::SpcialHolidaysController < ApplicationController
  def new
    @spcial_holiday = SpcialHoliday.new
    @date = params[:date]
    @date_to = @date.to_date
  end

  def create
    @spcial_holiday = SpcialHoliday.new(spcial_params)
    binding.pry
    if @spcial_holiday.save
      redirect_to admins_salon_salon_details_path(current_admin.salon.id)
    else
      render :new
    end
  end

  private

  def spcial_params
    params.require(:spcial_holiday).permit().merge(salon_id: current_admin.salon.id)
  end

  
end
