class SalonShift < ApplicationRecord
  belongs_to :salon_detail
  belongs_to :shift_salon
end
