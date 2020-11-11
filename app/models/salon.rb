class Salon < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one :resevation
  has_one :user
  has_one :salon_detail
  belongs_to :admin,  optional: true
  has_one_attached :salon_top_image, dependent: :destroy
  has_one_attached :salon_bottom_image, dependent: :destroy
  with_options presence: true do
    validates :start_time
    validates :end_time
    validates :salon_name
    validates :salon_name_cana
    validates :post_code, { with: /\A[0-9]{3}-[0-9]{4}\z/, message: '数字3文字(-)４文字入力してください'}
    validates :prefecture
    validates :address_all
  end

end
