class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.datetime :calendar_datetime

      t.timestamps
    end
  end
end
