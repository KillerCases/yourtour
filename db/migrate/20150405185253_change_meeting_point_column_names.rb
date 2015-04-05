class ChangeMeetingPointColumnNames < ActiveRecord::Migration
  def change
    rename_column :tours, :meeting_point_latitude, :latitude
    rename_column :tours, :meeting_point_longitude, :longitude
    rename_column :tours, :meeting_point_address, :address
    
  end
end
