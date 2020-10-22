class Users::UsersController < ApplicationController
  def index
    salon_all
    @users = User.all
  end

  private

  def salon_all
    @salons = Salon.all 
    @salons.each do |salon|
      @salon = salon
    end
  end
end
