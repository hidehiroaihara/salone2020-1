class StyleCategoryList < ApplicationRecord
  has_many :style_category_twos
  has_many :menus, through: :style_category_twos
end
