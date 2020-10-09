class StyleCategoryList < ApplicationRecord
  # extend ActiveHash::Associations::ActiveRecordExtensions
  # belongs_to_active_hash :style_category
  has_many :style_category_twos
  has_many :menus, through: :style_category_twos
end
