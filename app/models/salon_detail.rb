class SalonDetail < ApplicationRecord
  belongs_to :salon
  has_many :salon_spcial_holidays, dependent: :destroy
  has_many :spcial_holidays, through: :salon_spcial_holidays
  has_many :salon_shifts, dependent: :destroy
  has_many :shift_salons, through: :salon_shifts
  has_many :salon_spcial_holidays, dependent: :destroy
  has_many :spcial_holidays, through: :salon_spcial_holidays
  has_many :salon_regular_holidays, dependent: :destroy
  has_many :regular_holidays, through: :salon_regular_holidays
end
