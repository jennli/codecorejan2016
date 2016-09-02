class AddGeocodingFieldsToApartmentListings < ActiveRecord::Migration
  def change
    add_column :apartment_listings, :longitude, :float
    add_column :apartment_listings, :latitude, :float
  end
end
