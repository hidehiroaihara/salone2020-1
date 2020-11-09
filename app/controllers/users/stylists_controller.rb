class Users::StylistsController < ApplicationController
  before_action :admin_id
  def index
    @stylists = Stylist.all
    salon_all
  end

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

  def admin_id
    admins = Admin.all
    admins.each do |admin|
      @admin = admin
    end
  end
  
end
