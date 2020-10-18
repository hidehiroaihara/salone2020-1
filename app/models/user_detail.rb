class UserDetail < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender
  belongs_to_active_hash :blood
  belongs_to_active_hash :job
  belongs_to_active_hash :consent
  belongs_to :user, optional: true

  validates :consent, presence: true

end
