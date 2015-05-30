class TourGuide < ActiveRecord::Base
  
    validates :tour_guide_image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }
  
    # This method associates the attribute ":tour_image" with a file attachment
    has_attached_file :tour_guide_image, styles: {
    thumb: '100x100#',
    square: '200x200#',
    medium: '300x300>'
  }
  
end
