class CreateApartmentListings < ActiveRecord::Migration
  def change
    create_table :apartment_listings do |t|
      t.string :title
      t.string :pic_1
      t.text :description
      t.integer :daily_price
      t.integer :monthly_price
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
