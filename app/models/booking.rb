class Booking < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user
  
  STATUS = %w[pending paid refunded]
  
  after_initialize :set_default_status, :if => :new_record?

  def self.search(query)
    # where(:name, query) -> This would return an exact match of the query
    where("status like ?", "%#{query}%") 
  end
  
  
  def set_default_status
    self.status ||= :pending
  end

  
end
