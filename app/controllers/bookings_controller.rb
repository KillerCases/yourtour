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
    total_adult = (@booking.count_adult * @booking.calendar.tour.tour_price.price_adult)
    total_child = (@booking.count_child * @booking.calendar.tour.tour_price.price_child)
    @booking.total = total_adult + total_child  
  end
  
  def get_calendar
    returns params[:calendar_id]
  end

  def show
    respond_with(@booking)
  end

  def new 
    @booking = Booking.new
    @calendar = Calendar.find(params[:calendar_id]) 
    respond_with(@booking)
  end

  def edit
    calculate_total
  end

  def create
#     @booking = Booking.new(booking_params)
#     @booking.save
#     respond_with(@booking)

    @booking = Booking.new(booking_params)
    @calendar = Calendar.find(params[:calendar_id]) 
    @booking.user_id = current_user.id
    @booking.calendar_id = @calendar.id
    calculate_total
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
      params.require(:booking).permit(:user_id, :calendar_id, :stripe_card_token, :count_adult, :count_child, :total, :status)
#       params[:booking]
    end
  
end
