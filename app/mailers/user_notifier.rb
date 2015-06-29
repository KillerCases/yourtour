class UserNotifier < ActionMailer::Base
  default :from => 'me@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_booking_confirmation_email(user)
    @booking = booking
    mail( :to => current_user.email,
    :subject => 'Thanks for making a booking' )
  end
end
