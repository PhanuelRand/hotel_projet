class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :reservations
  has_many :reservation_chambres, through: :reservations

  has_many :user_roles
  has_many :roles, through: :user_roles 


  def user_admin
    if self.email != nil
      self.user_roles.each do |u|
        return u.role.role_type == "Admin"
      end
    end
  end
end
