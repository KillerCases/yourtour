class AddTourCityToTours < ActiveRecord::Migration
  def change
    add_column :tours, :tour_city_id, :integer
  end
end
