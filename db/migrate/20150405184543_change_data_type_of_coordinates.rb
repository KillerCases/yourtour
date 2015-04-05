class ChangeDataTypeOfCoordinates < ActiveRecord::Migration
  def change
    change_column :tours, :meeting_point_latitude, :float
    change_column :tours, :meeting_point_longitude, :float
    add_column :tours, :meeting_point_address, :string
  end
end
