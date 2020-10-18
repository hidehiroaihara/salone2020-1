class Stylist < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :rank

  has_many :reservations
  has_many :users
  has_one :stylist_detail
  has_one_attached :image
  has_many_attached :portraits

  def set_name
    self.stylist_first_name + self.stylist_last_name
  end
  def set_name_cana
    self.stylist_first_name_cana + self.stylist_last_name_cana
  end
  with_options presence: true do
    validates :rank
    validates :stylist_first_name
    validates :styliset_last_name
    validates :stylist_last_name_cana
    validates :stylist_first_name_cana
    validates :stylist_number
    validates :catchphrase
    validates :self_introduction
 end

 validates :gender_id, numericality: { other_than: 0, message: "can't be blank" }
 PRICE_REGEX = /\A[0-9]+\z/.freeze
 validates_format_of :nomination_price, with: PRICE_REGEX, message: 'には半角数字で入力して下さい'

end
