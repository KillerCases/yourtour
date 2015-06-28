class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  load_and_authorize_resource
  
  
  Mail.defaults do
  delivery_method :smtp, {
    :address => 'smtp.sendgrid.net',
    :port => '587',
    :domain => 'heroku.com',
    :user_name => ENV['SENDGRID_USERNAME'],
    :password => ENV['SENDGRID_PASSWORD'],
    :authentication => :plain,
    :enable_starttls_auto => true
  }
end

  def index
    
    if params[:search].present?
      if can? :manage, @booking
        @bookings = Booking.search(params[:search]).order("created_at DESC")
      else
        @bookings = Booking.search(params[:search]).where(user_id: current_user.id).order("created_at DESC")
      end
    elsif can? :manage, @booking
      @bookings = Booking.all.order("created_at DESC")
    else
      @bookings = Booking.where(user_id: current_user.id).order("created_at DESC")
    end
    
    respond_with(@bookings)
    
  end
  
  def calculate_total
      total_adult = (@booking.count_adult.to_i * @booking.calendar.tour.tour_price.price_adult)
      total_child = (@booking.count_child.to_i * @booking.calendar.tour.tour_price.price_child)
      return total_adult + total_child 
  end

  def show
    respond_with(@booking)
  end

  def new 
    
#     Mail.deliver do
#       to 'jollyolewight@gmail.com'
#       from 'sender@example.com'
#       subject 'testing send mail'
#       body 'Sending email with Ruby through SendGrid!'
#     end
    
    @tour = Tour.find(params[:tour_id])
    @calendars = Calendar.where(tour_id: params[:tour_id]).where("calendar_datetime >= :date", date: Date.today)  
    if @calendars.first.nil?
      @calendar_request = CalendarRequest.new(tour_id: params[:tour_id], user_id: current_user.id)
      @calendar_request.save
      redirect_to tour_path(:id => @calendar_request.tour_id)
      flash[:alert] = "Hey there! No dates are scheduled for this tour. We need to change that."
    else
        if params[:calendar_id]
          @calendar_selected = Calendar.find(params[:calendar_id])
        else 
          @calendar_selected = Calendar.last
        end  
    end
  end

  def edit
    
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.save
    respond_with(@booking)
    @user = current_user
#     logger.info (ENV['SENDGRID_USERNAME'])
#     logger.info (ENV['SENDGRID_PASSWORD'])
    UserNotifier.send_booking_confirmation_email(current_user).deliver    
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.total = calculate_total
    @booking.save

        respond_to do |format|
          if @booking.save 
            format.html { redirect_to new_charge_path(:booking_id => @booking.id), notice: 'Please confirm payment' }
            format.json { render :show, status: :created, location: @booking }
          else
            format.html { render :new }
            format.json { render json: @booking.errors, status: :unprocessable_entity }
          end  
        end
      
    
  end

  def update
    @booking.update(booking_params)
  end

  def destroy
    if @booking.status === 'paid'
      flash[:error] = 'Please refund booking before deleting'
      redirect_to bookings_path
    else
      @booking.destroy
        respond_to do |format|
          format.html { redirect_to bookings_url, notice: 'Booking was successfully deleted.' }
        format.json { head :no_content }
      end
    end 
  end
 

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
#       params.permit(:booking, :user_id, :calendar_id, :stripe_card_token)
      params.require(:booking).permit(:user_id, :calendar_id, :stripe_card_token, :count_adult, :count_child, :total, :status)
#       params[:booking]
    end
  
end
