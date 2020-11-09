class RegularHoliday < ApplicationRecord
  has_many :salon_regular_holidays, dependent: :destroy
  has_many :salons, through: :salon_regular_holidays
end
