class ShiftSalon < ApplicationRecord
  has_many :salon_shifts, dependent: :destroy
  has_many :salons, through: :salon_shifts
end
