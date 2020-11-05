class Stylist < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :rank

  has_many :reservations
  has_many :users
  has_one :stylist_detail, dependent: :destroy
  has_one_attached :image, dependent: :destroy
  has_many_attached :portraits, dependent: :destroy

  def set_name
    self.stylist_first_name + self.stylist_last_name
  end
  def set_name_cana
    self.stylist_first_name_cana + self.stylist_last_name_cana
  end
 
end
