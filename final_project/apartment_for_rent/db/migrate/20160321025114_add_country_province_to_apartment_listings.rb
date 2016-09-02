class AddCountryProvinceToApartmentListings < ActiveRecord::Migration
  def change
    add_column :apartment_listings, :country, :string
    add_column :apartment_listings, :province, :string
  end
end
