class AddLocationsToTours < ActiveRecord::Migration
  def change
    add_column :tours, :meeting_point_latitude, :decimal
    add_column :tours, :meeting_point_longitude, :decimal
    add_column :tours, :meeting_point_description, :string
    add_column :tours, :min_customer_threshold, :integer
  end
end
