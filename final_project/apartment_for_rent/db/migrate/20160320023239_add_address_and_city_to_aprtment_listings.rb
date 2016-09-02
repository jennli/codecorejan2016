class AddAddressAndCityToAprtmentListings < ActiveRecord::Migration
  def change
    add_column :apartment_listings, :address, :string
    add_column :apartment_listings, :city, :string
  end
end
