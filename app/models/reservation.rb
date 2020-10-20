class Reservation < ApplicationRecord
  belongs_to :stylist
  belongs_to :user
  belongs_to :salon
  belongs_to :menu
end
