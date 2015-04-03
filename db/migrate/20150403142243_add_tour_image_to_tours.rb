class AddTourImageToTours < ActiveRecord::Migration
  def self.up
    add_attachment :tours, :tour_image
  end

  def self.down
    remove_attachment :tours, :tour_image
  end
end
