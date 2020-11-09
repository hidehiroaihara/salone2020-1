class SpcialHoliday < ApplicationRecord
  has_many :salon_spcial_holidays, dependent: :destroy
  has_many :salons, through: :salon_spcial_holidays
end
