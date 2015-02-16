class TourGuidesController < ApplicationController
  before_action :set_tour_guide, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tour_guides = TourGuide.all
    respond_with(@tour_guides)
  end

  def show
    respond_with(@tour_guide)
  end

  def new
    @tour_guide = TourGuide.new
    respond_with(@tour_guide)
  end

  def edit
  end

  def create
    @tour_guide = TourGuide.new(tour_guide_params)
    @tour_guide.save
    respond_with(@tour_guide)
  end

  def update
    @tour_guide.update(tour_guide_params)
    respond_with(@tour_guide)
  end

  def destroy
    @tour_guide.destroy
    respond_with(@tour_guide)
  end

  private
    def set_tour_guide
      @tour_guide = TourGuide.find(params[:id])
    end

    def tour_guide_params
      params.require(:tour_guide).permit(:name, :description)
    end
end
