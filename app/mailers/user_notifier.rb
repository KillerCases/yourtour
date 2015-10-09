class UserNotifier < ActionMailer::Base
  default :from => ENV["EMAIL_ADDRESS"]

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_booking_confirmation_email(user, booking)
    @user = user
    @booking = booking
    mail( :to => user.email,
      :subject => 'Thanks for your booking' )
  end

  def send_cancellation_confirmation_email(user, booking)
    @user = user
    @booking = booking
    mail( :to => user.email,
      :subject => 'Booking cancelled' )
  end
  
end
