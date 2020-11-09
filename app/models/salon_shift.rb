class SalonShift < ApplicationRecord
  belongs_to :salon
  belongs_to :shift_salon
end
