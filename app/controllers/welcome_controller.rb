class WelcomeController < ApplicationController
  
  
  def index
    
    if params[:search_location].present?
      if params[:search].present?
        @tours = Tour.near(params[:search_location], 50).search(params[:search]).order("created_at DESC")
      else
        @tours = Tour.near(params[:search_location], 50)
      end
    elsif params[:search]
      @tours = Tour.search(params[:search]).order("created_at DESC")
    else
      @tours = Tour.all
    end
    
  end
  
  def your_bookings
      @user_bookings = Booking.where(user_id: current_user.id)
  end

  def about
  end

  def contact
  end

  def faq
  end
end
