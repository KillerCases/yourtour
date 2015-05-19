class Booking < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user
  
  STATUS = %w[pending paid refunded]
  
  after_initialize :set_default_status, :if => :new_record?

  def set_default_status
    self.status ||= :pending
  end

  
end
