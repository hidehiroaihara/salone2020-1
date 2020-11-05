class Users::StylistsController < ApplicationController
  def show
    salon_all
    @stylist = Stylist.find(params[:id])
  end 

  private

  def salon_all
    @salons = Salon.all 
    @salons.each do |salon|
      @salon = salon
    end
  end
end
