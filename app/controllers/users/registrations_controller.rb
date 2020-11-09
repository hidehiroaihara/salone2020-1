# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  def new
    @user = User.new
  end

  def create
    @user = User.new(sign_up_params)
    admin_id = @user.salon.admin_id
    @user.admin_id = admin_id.to_i
    unless @user.valid?(:registration)
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    session["address"] = @address.attributes
    @detail = @user.build_user_detail
    render :new_detail
  end

  def create_detail
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(session["address"])
    @detail = UserDetail.new(detail_params)
    unless @detail.valid?(:registration)
      flash.now[:alert] = @detail.errors.full_messages
      render :new_detail and return
    end
    @user.build_address(@address.attributes)
    @user.build_user_detail(@detail.attributes)
    @user.build_user_information
    @user.build_user_option
    @user.save(context: :registration)
    session["devise.regist_data"]["user"].clear
    session["address"].clear
    sign_in(:user, @user)
    redirect_to root_path
  end

  protected
  
  def address_params
    params.require(:address).permit(:post_code, :prefecture_id, :address_all)
  end
  
  def detail_params
    params.require(:user_detail).permit(:blood_id, :job_id, :consent_id, :gender_id )
  end
end
