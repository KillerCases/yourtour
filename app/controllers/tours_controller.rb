class ToursController < ApplicationController
  before_action :set_tour, only: [:show, :edit, :update, :destroy]

  # GET /tours
  # GET /tours.json
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
  
#   def find_calendar
#       @calendar = Calendar.where(tour_id: @tour.id)
#   end
  

  # GET /tours/1
  # GET /tours/1.json
  def show
    @calendars = Calendar.where(tour_id: @tour.id) 
    @date = params[:month] ? Date.parse(params[:month]) : Date.today
  end

  # GET /tours/new
  def new
    @tour = Tour.new
  end

  # GET /tours/1/edit
  def edit
  end

  # POST /tours
  # POST /tours.json
  def create
    @tour = Tour.new(tour_params)

    respond_to do |format|
      if @tour.save
        format.html { redirect_to @tour, notice: 'Tour was successfully created.' }
        format.json { render :show, status: :created, location: @tour }
      else
        format.html { render :new }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tours/1
  # PATCH/PUT /tours/1.json
  def update
    respond_to do |format|
      if @tour.update(tour_params)
        format.html { redirect_to @tour, notice: 'Tour was successfully updated.' }
        format.json { render :show, status: :ok, location: @tour }
      else
        format.html { render :edit }
        format.json { render json: @tour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tours/1
  # DELETE /tours/1.json
  def destroy
    @tour.destroy
    respond_to do |format|
      format.html { redirect_to tours_url, notice: 'Tour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def import
    Tour.import(params[:file])
    redirect_to tours_path, notice: "Tours added successfully"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tour
      @tour = Tour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tour_params
      params.require(:tour).permit(:created_at, :name, :short_description, :long_description, :tour_guide_id, :tour_city_id, :tour_price_id, :latitude, :longitude, :address, :meeting_point_description, :min_customer_threshold, :tour_image)
    end
end
