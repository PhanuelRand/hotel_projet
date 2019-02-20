class Reservation < ActiveRecord::Base
  attr_accessible :date_arrive, :date_depart, :demande_particuliere, :user_age, :user_email, :user_id, :user_name, :list_chambres

  belongs_to :user

  has_many :reservation_chambres
  has_many :chambres, through: :reservation_chambres

  validates :date_arrive, presence: true
  validates :date_depart, presence: true
  validates :demande_particuliere, presence: true
  validates :user_age, presence: true
  validates :user_email, presence: true
  validates :demande_particuliere, presence: true
  validates :list_chambres, presence: true


  def nb_days
    (self.date_depart.to_date - self.date_arrive.to_date).to_i
  end

  def total_price
    total = 0 
    self.reservation_chambres.each do |r|
      total += r.chambre.get_price * self.nb_days
    end
    return total
  end
end
