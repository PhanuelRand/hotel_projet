class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :reservations
  has_many :reservation_chambres, through: :reservations

  has_many :user_roles
  has_many :roles, through: :user_roles 

  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :remember_me, presence: true
  
  def user_admin(role="")
    self.roles.map{|x| x.role_type}.include?(role)
  end

  # def user_admin(roles)
  #   list_role = []
  #   list_role = roles
  #   self.roles.map.any?{|x| x.role_type}.include?(list_role)
  # end
end
