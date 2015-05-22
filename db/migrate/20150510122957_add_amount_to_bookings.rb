class AddAmountToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :count_adult, :integer
    add_column :bookings, :count_child, :integer
    add_column :bookings, :total, :integer
  end
end
