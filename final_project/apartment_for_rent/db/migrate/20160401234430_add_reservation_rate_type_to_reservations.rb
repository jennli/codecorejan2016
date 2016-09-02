class AddReservationRateTypeToReservations < ActiveRecord::Migration
  def change
    add_column :reservations, :rate_type, :string
  end
end
