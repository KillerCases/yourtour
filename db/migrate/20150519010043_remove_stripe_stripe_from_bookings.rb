class RemoveStripeStripeFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :stripe_customer_token
  end
end
