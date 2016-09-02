class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.integer :price
      t.date :checkin_date
      t.date :checkout_date
      t.references :user, index: true, foreign_key: true
      t.references :apartment_listing, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
