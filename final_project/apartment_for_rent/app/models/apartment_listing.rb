class ApartmentListing < ActiveRecord::Base
  belongs_to :user
  has_many :reservations, dependent: :nullify
  mount_uploader :pic_1, PictureUploader

  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  validates :title, presence: true
  validates :pic_1, presence: true
  validates :daily_price, presence: true, unless: :monthly_price?


  def full_address
    "#{address} #{city} #{province} #{country}"
  end

end
