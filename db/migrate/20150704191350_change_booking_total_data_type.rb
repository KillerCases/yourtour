class ChangeBookingTotalDataType < ActiveRecord::Migration
  def change
    change_column :bookings, :total, :decimal
  end
end
