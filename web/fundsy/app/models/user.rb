class User < ActiveRecord::Base
  has_many :pledges, dependent: :destroy
  has_many :campaigns, dependent: :nullify

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  has_secure_password
  # accessor :password
  geocoded_by :address
  after_validation :geocode

  def full_name
    "#{first_name} #{last_name}".strip.titleize
  end
end
