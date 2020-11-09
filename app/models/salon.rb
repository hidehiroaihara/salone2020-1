class Salon < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  has_one :resevation
  has_one :user
  has_one :salon_detail
  belongs_to :admin,  optional: true
  has_one_attached :salon_top_image, dependent: :destroy
  has_one_attached :salon_bottom_image, dependent: :destroy
  has_many :salon_spcial_holidays, dependent: :destroy
  has_many :spcial_holidays, through: :salon_spcial_holidays
  has_many :salon_shifts, dependent: :destroy
  has_many :shift_salons, through: :salon_shifts
  has_many :salon_spcial_holidays, dependent: :destroy
  has_many :spcial_holidays, through: :salon_spcial_holidays
  has_many :salon_regular_holidays, dependent: :destroy
  has_many :regular_holidays, through: :salon_regular_holidays
  
end
