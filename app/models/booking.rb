class Booking < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user
  
  attr_accessor :stripe_card_token
  
  STATUS = %w[paid refunded basic]
  
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :basic
  end

def save_with_payment
  if valid?
    customer = Stripe::Customer.create(description: 'test', card: stripe_card_token)
    self.stripe_customer_token = customer.id
    save!
  end
rescue Stripe::InvalidRequestError => e
  logger.error "Stripe error while creating customer: #{e.message}"
  errors.add :base, "There was a problem with your credit card."
  false
end


  
end
