class CreateTourGuides < ActiveRecord::Migration
  def change
    create_table :tour_guides do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
