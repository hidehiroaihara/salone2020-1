class Admins::UserOptionsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_user
  before_action :set_user_option, only: [:edit, :update, :destroy]

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

  def edit
  end

  def update
    if @user_option.update(user_option_params)
      redirect_to admins_reservations_path
    else
      render :edit
    end
  end

  def destroy
    if @user_option.destroy
      redirect_to admins_reservations_path
    else
      render :index
    end
  end

  private

  def user_option_params
    params.require(:user_option).permit(:menu_time_id, :menu_id).merge(user_id: @user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_user_option
    @user_option = UserOption.find(params[:id])
  end
end
