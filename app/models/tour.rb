class Tour < ActiveRecord::Base
  belongs_to :tour_guide
  belongs_to :tour_city
  belongs_to :tour_price
 
  validates :name, presence: true, uniqueness: true
 
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
    square: '200x200#',
    medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :tour_image, :content_type => /\Aimage\/.*\Z/
  
  
end
