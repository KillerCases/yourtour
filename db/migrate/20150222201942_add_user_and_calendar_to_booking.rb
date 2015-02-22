class AddUserAndCalendarToBooking < ActiveRecord::Migration
  def change
    add_column :bookings, :calendar_id, :integer
    add_column :bookings, :user_id, :integer
  end
end
