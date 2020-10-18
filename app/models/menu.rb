class Menu < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :customer_type
  belongs_to_active_hash :menu_time
  has_many :style_category_twos, dependent: :destroy
  has_many :style_category_lists, through: :style_category_twos
  accepts_nested_attributes_for :style_category_twos
  has_many :reservations
  has_many :user_options
end
