class Reservation < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :status
  belongs_to :stylist
  belongs_to :user
  belongs_to :salon
  belongs_to :menu
  belongs_to :admin, optional: true
end
