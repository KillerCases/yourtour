class TourPricesController < ApplicationController
  before_action :set_tour_price, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tour_prices = TourPrice.all
    respond_with(@tour_prices)
  end

  def show
    respond_with(@tour_price)
  end

  def new
    @tour_price = TourPrice.new
    respond_with(@tour_price)
  end

  def edit
  end

  def create
    @tour_price = TourPrice.new(tour_price_params)
    @tour_price.save
    respond_with(@tour_price)
  end

  def update
    @tour_price.update(tour_price_params)
    respond_with(@tour_price)
  end

  def destroy
    @tour_price.destroy
    respond_with(@tour_price)
  end

  private
    def set_tour_price
      @tour_price = TourPrice.find(params[:id])
    end

    def tour_price_params
      params.require(:tour_price).permit(:name, :duration, :price_adult, :price_child, :currency)
    end
end
