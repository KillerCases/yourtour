class TourCitiesController < ApplicationController
  before_action :set_tour_city, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  load_and_authorize_resource

  def index
    @tour_cities = TourCity.all
    respond_with(@tour_cities)
  end

  def show
    respond_with(@tour_city)
  end

  def new
    @tour_city = TourCity.new
    respond_with(@tour_city)
  end

  def edit
  end

  def create
    @tour_city = TourCity.new(tour_city_params)
    @tour_city.save
    respond_with(@tour_city)
  end

  def update
    @tour_city.update(tour_city_params)
    respond_with(@tour_city)
  end

  def destroy
    @tour_city.destroy
    respond_with(@tour_city)
  end

  private
    def set_tour_city
      @tour_city = TourCity.find(params[:id])
    end

    def tour_city_params
      params.require(:tour_city).permit(:city, :country)
    end
end
