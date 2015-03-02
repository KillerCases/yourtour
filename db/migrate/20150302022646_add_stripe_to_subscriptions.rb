class AddStripeToSubscriptions < ActiveRecord::Migration
  def change
    add_column :bookings, :stripe_customer_token, :string
  end
end
