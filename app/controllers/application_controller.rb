class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :name, :first_name, :last_name, :first_name_cana, :last_name_cana, :birthday, :phone_number, :gender_id, :stylist_id, :blood_type_id, :job_id, :customer_text, :member_id, :customer_number, :age_id, :post_code, :prefecture_id, :address_all, :information_date, :information_text, :visit_time, :consent_id])
  end
end
