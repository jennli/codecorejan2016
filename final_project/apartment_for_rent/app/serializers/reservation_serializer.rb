class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :price, :checkin_date, :checkout_date
  has_one :user
  has_one :apartment_listing
end
