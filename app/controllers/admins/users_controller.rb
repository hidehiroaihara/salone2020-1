class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show, :destroy] 
  def index
    age_update
    @search_params = user_search_params
    @users = User.search(@search_params).includes(:stylist)#menu
    
  end

  def new
    @user = UserAddress.new
  end

  def create
    @user = UserAddress.new(user_params)
    if @user.save
       return redirect_to users_path
    else 
       render :new
    end
  end

  def show
  end

  def edit
    @user_address = UserAddress.new(first_name: @user.first_name, last_name: @user.last_name, first_name_cana: @user.first_name_cana, last_name_cana: @user.last_name_cana, phone_number: @user.phone_number, email: @user.email, customer_number: @user.customer_number, post_code: @user.address.post_code, prefecture_id: @user.address.prefecture_id, address_all: @user.address.address_all, gender_id: @user.gender_id, blood_type_id: @user.blood_type_id, job_id: @user.job_id, customer_text: @user.customer_text, member_id: @user.member_id, information_text: @user.information.information_text, consent: @user.message.consent, stylist_id: @user.stylist.id, birthday: @user.birthday, information_date: @user.information.information_date)
  end

  def update
    @user_address = UserAddress.new(user_params)
    if @user_address.save_update(params[:id])
       redirect_to users_path
    else
      render :edit 
    end
  end
  
  def destroy
    @user_address = UserAddress.new
    if @user_address.user_destroy(params[:id])
      redirect_to root_path
    else
      render :show
    end
  end
  private

  def user_params
    params.require(:user_address).permit(:first_name, :last_name, :first_name_cana, :last_name_cana, :phone_number, :email, :customer_number, :post_code, :prefecture_id, :address_all, :gender_id, :blood_type_id, :job_id, :customer_text, :member_id, :information_text, :visit_time, :consent, :stylist_id).merge(birthday: set_birthday, information_date: set_information_date )
  end

  def user_search_params
    params.fetch(:search, {}).permit(:first_name, :last_name, :first_name_cana, :last_name_cana, :phone_number,:email, :customer_number, :member_id, :visit_form, :visit_to, :visit_time, :birthday_form, :birthday_to, :gender_id, :job_id, :stylist_id,:age_id)
  end

  def age(birthday)
        if (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 >= 10 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 20
          return 1
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 20 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 30
          return 2
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 30 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 40
          return 3
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 40 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 50
          return 4
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 50 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 60
          return 5
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 60 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 70
          return 6
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 70 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 80
          return 7 
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 80 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 90
          return 8 
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 90 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 100
          return 9
        elsif (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) >= 100 && (Date.today.strftime('%Y%m%d').to_i - birthday.strftime('%Y%m%d').to_i) / 10000 < 200
          return 10  
        end
  end

  def age_update
    users = User.all
    users.each do |user|
      user.age_id = age(user.birthday)
      user.save
    end
  end  
  def set_birthday
    Date.new(params.require(:user_address).require("birthday(1i)").to_i,params.require(:user_address).require("birthday(2i)").to_i,params.require(:user_address).require("birthday(3i)").to_i)
  end

  def set_information_date
    Date.new(params.require(:user_address).require("information_date(1i)").to_i,params.require(:user_address).require("information_date(2i)").to_i,params.require(:user_address).require("information_date(3i)").to_i)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
end
