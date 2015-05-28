class Tour < ActiveRecord::Base
  belongs_to :tour_guide
  belongs_to :tour_city
  belongs_to :tour_price
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
 
  validates :name, presence: true, uniqueness: true
  validates :tour_image,
    attachment_content_type: { content_type: /\Aimage\/.*\Z/ },
    attachment_size: { less_than: 5.megabytes }
 
  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:name, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") 
  end
  
  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Tour.create! row.to_hash
    end
  end
  
  # This method associates the attribute ":tour_image" with a file attachment
  has_attached_file :tour_image, styles: {
    thumb: '100x100>',
    square: '420x420#',
    medium: '314x344#'
  }
  
  
end
