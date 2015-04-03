class AddImageToTourGuides < ActiveRecord::Migration
  
    def self.up
      add_attachment :tour_guides, :tour_guide_image
  end

  def self.down
    remove_attachment :tour_guides, :tour_guide_image
  end
  
end
