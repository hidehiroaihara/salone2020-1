class Salon < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one :resevation
  has_one :user
  has_one_attached :salon_top_image, dependent: :destroy
  has_one_attached :salon_bottom_image, dependent: :destroy

  
end
