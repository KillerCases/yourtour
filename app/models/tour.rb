class Tour < ActiveRecord::Base
  
#   attr_reader :name
 
  validates :name, presence: true, uniqueness: true
 
  # It returns the articles whose titles contain one or more words that form the query
  def self.search(query)
    # where(:name, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%") 
  end
  
 
#   def initialize(params)
#     params ||= {}
#     @name = parsed_date(params[:date_from], 7.days.ago.to_date.to_s)
#   end
  
end
