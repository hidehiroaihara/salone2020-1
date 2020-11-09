class Admins::MenusController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_menu, only: [:show, :edit, :destroy, :update]
  before_action :admin_id
  def index
    @menus = Menu.all
  end
  
  def new
   @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      return redirect_to admins_menus_path
    else 
      render :new
    end
  end

  def update
   if @menu.update(menu_params)
      redirect_to admins_menus_path
   else
      render :edit
   end
  end

  def destroy
     if @menu.destroy
      redirect_to admins_reservations_path
    else
      render :show
    end
  end

  private

  def menu_params
    params.require(:menu).permit(:menu_name, :price, :customer_type_id, :menu_text, :menu_time_id, {style_category_list_ids: []}).merge(admin_id: current_admin.id)
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def admin_id
    admins = Admin.all
    admins.each do |admin|
      @admin = admin
    end
  end
end
