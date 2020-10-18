class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  belongs_to :user, optional: true

  NAME_POST_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  validates_format_of :post_code, with: NAME_POST_REGEX, message: 'is invalid. Include hyphen(-)'
end
