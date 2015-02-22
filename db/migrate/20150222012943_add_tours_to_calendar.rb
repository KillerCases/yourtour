class AddToursToCalendar < ActiveRecord::Migration
  def change
    add_column :calendars, :tour_id, :integer
  end
end
