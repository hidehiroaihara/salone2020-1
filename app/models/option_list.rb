class OptionList < ApplicationRecord
  # has_many :option_lists, dependent: :destroy
  # has_many :style_category_lists, through: :options_lists
  # belongs_to :user
  belongs_to :user_option
  belongs_to :style_category_list
end
