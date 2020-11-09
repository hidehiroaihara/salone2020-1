class Admins::SaloneDetailsController < ApplicationController
  def index
  end

  def new
    @salon_detail = SalonDetail.new
  end

  private

end
