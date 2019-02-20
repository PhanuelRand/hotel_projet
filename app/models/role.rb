class Role < ActiveRecord::Base
  attr_accessible :role_type

  has_many :user_roles
  has_many :users, through: :user_roles  

  validates :role_type, presence: true
end
