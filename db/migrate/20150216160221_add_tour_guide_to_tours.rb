class AddTourGuideToTours < ActiveRecord::Migration
  def change
    add_column :tours, :tour_guide_id, :integer
  end
end
