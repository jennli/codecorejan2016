class ApartmentListingSerializer < ActiveModel::Serializer
  attributes :id, :title, :pic_1, :description, :daily_price, :monthly_price
  has_one :user
end
