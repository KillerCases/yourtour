class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  load_and_authorize_resource

  def index
    if can? :manage, @booking
      @bookings = Booking.all
    else
      @bookings = Booking.where(user_id: current_user.id)
    end
    respond_with(@bookings)
  end
  
  def calculate_total
    
    
  end

  def show
    @booking.total = (@booking.count_adult * @booking.calendar.tour.tour_price.price_adult)+(@booking.count_child * @booking.calendar.tour.tour_price.price_child)
    respond_with(@booking)
  end

  def new 
#     @calendar = Calendar.find(params[:calendar_id])
    @booking = Booking.new
    respond_with(@booking)
  end

  def edit
  end

  def create
#     @booking = Booking.new(booking_params)
#     @booking.save
#     respond_with(@booking)
    
 @booking = Booking.new(booking_params)
  if @booking.save_with_payment
    redirect_to @booking, :notice => "Thank you for your booking!"
  else
    render :new
  end
    
  end

  def update
    @booking.update(booking_params)
    respond_with(@booking)
  end

  def destroy
    @booking.destroy
    respond_with(@booking)
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
#       params.permit(:booking, :user_id, :calendar_id, :stripe_card_token)
      params.require(:booking).permit(:user_id, :calendar_id, :stripe_card_token, :count_adult, :count_child, :total)
#       params[:booking]
    end
end
