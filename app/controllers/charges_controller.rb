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
    @booking.update_attributes(:status => 'paid', :stripe_charge_id => charge["id"])
  end
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to booking_path(:id => @booking.id)
  end
  
  def destroy
    @booking = Booking.find(params[:booking_id])
    
    if @booking.status === 'paid' && @booking.calendar.calendar_datetime > Date.today
      @charge = @booking.stripe_charge_id
      ch = Stripe::Charge.retrieve(@charge)
      refund = ch.refunds.create
      @booking.update_attributes(:status => 'refunded')
      flash[:alert] = "This booking has been cancelled"
      redirect_to bookings_path
    elsif @booking.status === 'paid' && @booking.calendar.calendar_datetime < Date.today
      flash[:error] = "This booking cannot be cancelled as it occured in the past"
      redirect_to bookings_path
    elsif @booking.status === 'refunded'
      flash[:error] = "This booking has already been cancelled and refunded."
      redirect_to bookings_path
    elsif @booking.status === 'pending'
      flash[:error] = "This booking has not yet been confirmed and no payment has been taken."
      redirect_to bookings_path
    end 
  end

  
end



