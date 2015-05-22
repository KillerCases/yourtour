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
      total_adult = (@booking.count_adult.to_i * @booking.calendar.tour.tour_price.price_adult)
      total_child = (@booking.count_child.to_i * @booking.calendar.tour.tour_price.price_child)
      return total_adult + total_child 
  end

  def show
    respond_with(@booking)
  end

  def new 
    @calendar = Calendar.find(params[:calendar_id]) 
    
    if @calendar.calendar_datetime >= Date.today
      @booking = Booking.new
      respond_with(@booking)
    else
      flash[:alert] = 'Please select a date in future'
      redirect_to tour_path(:id => @calendar.tour.id)
    end
    
  end

  def edit
    
  end

  def create
#     @booking = Booking.new(booking_params)
#     @booking.save
#     respond_with(@booking)
    
    @calendar = Calendar.find(params[:calendar_id]) 
    @booking = Booking.new(booking_params)
    
    if @booking.count_adult.blank? 
        flash[:error] = "Please select number of adults"
        redirect_to new_booking_path(:calendar_id => @calendar.tour.id)
    else
        @booking.user_id = current_user.id
        @booking.calendar_id = @calendar.id
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
