class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # def after_sign_in_path_for(resource)
  #   if admin_signed_in?
  #     redirect_to admins_reservations_path
  #   end
  # end
  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :admin, :first_name, :last_name, :first_name_cana, :last_name_cana, :birthday, :phone_number, :custumer_number, :stylist_id, :age_id])
  end
end
