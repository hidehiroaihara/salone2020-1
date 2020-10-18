class StylistDetail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :stylist_history
  belongs_to_active_hash :style_type
  belongs_to_active_hash :nomination

  belongs_to :stylist

  if self.stylist.rank_id == 1
    with_options presence: true do
      validates :stylist_history
      validates :nomination
      validates :style_type
    end
  end
end
