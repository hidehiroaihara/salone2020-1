class UserAddressDetail
  include ActiveModel::Model
  attr_accessor :first_name, :last_name, :first_name_cana, :last_name_cana, :email, :birthday, :phone_number, :gender_id, :stylist_id, :blood_id, :job_id, :post_code, :prefecture_id, :address_all, :user_id, :consent_id, :salon_id

  def save_update(user_id)
    user = User.find(user_id)
    useraddress = user.address
    userdetail = user.user_detail
    user.update(first_name: first_name, last_name: last_name, first_name_cana: first_name_cana, last_name_cana: last_name_cana, email: email, birthday: birthday, phone_number: phone_number,  stylist_id: stylist_id, salon_id: salon_id)
    useraddress.update(post_code: post_code, prefecture_id: prefecture_id, address_all: address_all)
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