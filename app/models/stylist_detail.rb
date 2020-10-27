class StylistDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :stylist_history
  belongs_to_active_hash :style_type
  belongs_to_active_hash :nomination

  belongs_to :stylist
  
end
