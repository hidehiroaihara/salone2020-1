class UserInformation < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :member
  belongs_to :user, optional: true
end
