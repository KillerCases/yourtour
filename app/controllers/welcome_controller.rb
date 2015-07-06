class WelcomeController < ApplicationController
  
  
  def index
    if params[:start].present?
    time_range = (Date.strptime(params[:start], '%m/%d/%Y') - 1.day)..(Date.strptime(params[:end], '%m/%d/%Y') + 1.day)
    end

    if params[:search_location].blank?
      if params[:start].blank?
        @tours = Tour.search(params[:search]).order("created_at DESC")
      else
        @tours = Tour.search(params[:search]).order("created_at DESC").joins(:calendars).where(calendars: {calendar_datetime: time_range}) 
      end
    elsif
      if params[:start].blank?
        @tours = Tour.near(params[:search_location], 50).search(params[:search]).order("created_at DESC")
      else
        @tours = Tour.near(params[:search_location], 50).search(params[:search]).order("created_at DESC").joins(:calendars).where(calendars: {calendar_datetime: time_range}) 
      end
    else
      @tours = Tour.all
    end
    
  end

  def about
  end

  def contact
  end

  def faq
  end
end
