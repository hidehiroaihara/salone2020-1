class Admins::MenusController < ApplicationController
  before_action :authenticate_admin!
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

  private

  def menu_params
    params.require(:menu).permit(:menu_name, :price, :customer_type_id, :menu_text, {style_category_list_ids: []})
  end
end
