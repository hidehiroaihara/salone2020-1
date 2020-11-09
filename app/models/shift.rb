class Shift < ApplicationRecord
  has_many :stylist_shifts, dependent: :destroy
  has_many :stylists, through: :stylist_shifts
end
