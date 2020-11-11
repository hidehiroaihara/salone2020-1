class ShiftSalon < ApplicationRecord
  has_many :salon_shifts, dependent: :destroy
  has_many :salon_details, through: :salon_shifts
end
