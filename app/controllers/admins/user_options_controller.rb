class Admins::UserOptionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user

  def index 
    @user_options = UserOption.all
    # binding.pry
  end
  
  def new
    # binding.pry
    @user_option = UserOption.new
  end

  def create
    @user_option = UserOption.new(user_option_params)
    if @user_option.save
      redirect_to admins_reservations_path
    else
      render :new
    end
  end

  private

  def user_option_params
    params.require(:user_option).permit(:menu_time_id, {style_category_list_ids: []}).merge(user_id: @user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
