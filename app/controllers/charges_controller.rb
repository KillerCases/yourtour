class ChargesController < ApplicationController
  
  def new
    @booking = Booking.find(params[:booking_id])
    @amount = @booking.total
  end

  def create

    
    customer = Stripe::Customer.create(
      :email => current_user.email,
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Your Tour customer',
      :invoice     => '@booking.id',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
  
end
