class UserRole < ActiveRecord::Base
  attr_accessible :role_id, :user_id

  belongs_to :user
  belongs_to :role

  validates :role_id, presence: true
  validates :user_id, presence: true
end
