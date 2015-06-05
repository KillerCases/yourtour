class CreateCalendarRequests < ActiveRecord::Migration
  def change
    create_table :calendar_requests do |t|
      t.integer :tour_id
      t.integer :user_id

      t.timestamps
    end
  end
end
