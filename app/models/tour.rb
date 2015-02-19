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
  
    
  
end
