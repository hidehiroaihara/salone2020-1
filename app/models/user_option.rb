class UserOption < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :menu_time
  belongs_to :user,  optional: true
  belongs_to :menu,  optional: true
  
end
