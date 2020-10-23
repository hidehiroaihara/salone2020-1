class StylistDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :stylist_history
  belongs_to_active_hash :style_type
  belongs_to_active_hash :nomination

  belongs_to :stylist
  # def rank
  #   stylists = Stylist.all
  #   stylists.each do |stylist|
  #     rank = stylist.stylist_detail.rank_id
  #   end
  # end 
  # if Stylist.pluck(:rank_id) == 1
  #   with_options presence: true do
  #     validates :stylist_history
  #     validates :nomination
  #     validates :style_type
  #   end
  # end
  PRICE_REGEX = /\A[0-9]+\z/.freeze
  validates_format_of :nomination_price, with: PRICE_REGEX, message: 'には半角数字で入力して下さい'
end
