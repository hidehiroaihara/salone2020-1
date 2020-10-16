class StyleCategoryList < ApplicationRecord
  has_many :style_category_twos
  has_many :menus, through: :style_category_twos
  has_many :option_lists
  has_many :user_options, through: :option_lists
end
