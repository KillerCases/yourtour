class CreateTourCities < ActiveRecord::Migration
  def change
    create_table :tour_cities do |t|
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
