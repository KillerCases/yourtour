class ChargesController < ApplicationController
  
  
  def new
    @booking = Booking.find(params[:booking_id])
    @amount = @booking.total
  end

  def create
    @booking = Booking.find(params[:booking_id])
    @amount = @booking.total*100
    
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :description => "User ID: #{@booking.user_id}",
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => "Booking ID: #{@booking.id}",  
      :currency    => 'gbp'
    )
    
  if charge["paid"] == true
    @booking.status = 'paid'
  end
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
  
end
