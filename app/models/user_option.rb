class UserOption < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :menu_time
  belongs_to :user,  optional: true
  has_many :option_lists, dependent: :destroy
  has_many :style_category_lists, through: :option_lists
end
