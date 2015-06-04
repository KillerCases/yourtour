class CalendarRequestsController < ApplicationController
  before_action :set_calendar_request, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @calendar_requests = CalendarRequest.all
    respond_with(@calendar_requests)
  end

  def show
    respond_with(@calendar_request)
  end

  def new
    @calendar_request = CalendarRequest.new
    respond_with(@calendar_request)
  end

  def edit
  end

  def create
    @calendar_request = CalendarRequest.new(calendar_request_params)
    @calendar_request.save
    respond_with(@calendar_request)
  end

  def update
    @calendar_request.update(calendar_request_params)
    respond_with(@calendar_request)
  end

  def destroy
    @calendar_request.destroy
    respond_with(@calendar_request)
  end

  private
    def set_calendar_request
      @calendar_request = CalendarRequest.find(params[:id])
    end

    def calendar_request_params
      params.require(:calendar_request).permit(:tour_id, :user_id)
    end
end
