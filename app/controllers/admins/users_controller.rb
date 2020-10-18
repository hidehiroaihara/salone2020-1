class UserAddress

  include ActiveModel::Model
  # include ActiveModel::Attributes
  attr_accessor :first_name, :last_name, :first_name_cana, :last_name_cana, :email, :birthday, :phone_number, :gender_id, :stylist_id, :blood_id, :job_id, :customer_text, :member_id, :customer_number, :post_code, :prefecture_id, :address_all, :user_id, :information_date, :information_text, :consent_id
  
  

  # def save
  #   user = User.create(first_name: first_name, last_name: last_name, first_name_cana: first_name_cana, last_name_cana: last_name_cana, email: email, birthday: birthday, phone_number: phone_number, gender_id: gender_id, stylist_id: stylist_id, blood_type_id: blood_type_id, job_id: job_id, customer_text: customer_text, customer_number: customer_number, member_id: member_id)
  #   Address.create(post_code: post_code, prefecture_id: prefecture_id, address_all: address_all, user_id: user.id)
  #   Information.create(information_date: information_date, information_text: information_text, user_id: user.id)
  #   Message.create(consent: consent, user_id: user.id)
  # end

  def save_update(user_id)
    user = User.find(user_id)
    useraddress = user.address
    userinformation = user.user_information
    userdetail = user.user_detail
    user.update(first_name: first_name, last_name: last_name, first_name_cana: first_name_cana, last_name_cana: last_name_cana, email: email, birthday: birthday, phone_number: phone_number,  stylist_id: stylist_id,  customer_number: customer_number)
    useraddress.update(post_code: post_code, prefecture_id: prefecture_id, address_all: address_all)
    userinformation.update(information_date: information_date, information_text: information_text, customer_text: customer_text, member_id: member_id)
    userdetail.update(consent_id: consent_id, gender_id: gender_id,  blood_id: blood_id, job_id: job_id)
  end
  def user_destroy(user_id)
    user = User.find(user_id)
    useraddress = user.address
    userinformation = user.user_information
    userdetail = user.user_detail
    user.destroy
    useraddress.destroy
    userinformation.destroy
    userdetail.destroy
  end
end
class Admins::UsersController < ApplicationController
  
  before_action :authenticate_admin!
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
       return redirect_to admins_users_path
    else 
       render :new
    end
  end

  def show
  end

  def edit
    @user_address = UserAddress.new(first_name: @user.first_name, last_name: @user.last_name, first_name_cana: @user.first_name_cana, last_name_cana: @user.last_name_cana, phone_number: @user.phone_number, email: @user.email, customer_number: @user.customer_number, post_code: @user.address.post_code, prefecture_id: @user.address.prefecture_id, address_all: @user.address.address_all, gender_id: @user.user_detail.gender_id, blood_id: @user.user_detail.blood_id, job_id: @user.user_detail.job_id, customer_text: @user.user_information.customer_text, member_id: @user.user_information.member_id, information_text: @user.user_information.information_text, consent_id: @user.user_detail.consent_id, stylist_id: @user.stylist.id, birthday: @user.birthday, information_date: @user.user_information.information_date)
     
  end

  def update
    # params[:user_address][:information_date] = set_information_date
    @user_address = UserAddress.new(user_params)
    if @user_address.save_update(params[:id])
       redirect_to admins_users_path
    else
      render :edit 
    end
  end
  
  def destroy
    @user_address = UserAddress.new
    if @user_address.user_destroy(params[:id])
      redirect_to admins_reservations_path
    else
      render :show
    end
  end
  private

  def user_params
    params.require(:user_address).permit(:first_name, :last_name, :first_name_cana, :last_name_cana, :phone_number, :email, :customer_number, :post_code, :prefecture_id, :address_all, :gender_id, :blood_id, :job_id, :customer_text, :member_id, :information_text, :visit_time, :consent_id, :stylist_id).merge(birthday: set_birthday, information_date: set_information_date )
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
    # date = params[:user_address][:birthday]
    # if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
    #   return
    # end
    Date.new(params.require(:user_address).require("birthday(1i)").to_i,params.require(:user_address).require("birthday(2i)").to_i,params.require(:user_address).require("birthday(3i)").to_i)
  end

  def set_information_date 
    date = params[:user_address]
    if date["information_date(1i)"].empty? && date["information_date(2i)"].empty? && date["information_date(3i)"].empty?
      return
    end
    Date.new(params.require(:user_address).require("information_date(1i)").to_i,params.require(:user_address).require("information_date(2i)").to_i,params.require(:user_address).require("information_date(3i)").to_i)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
