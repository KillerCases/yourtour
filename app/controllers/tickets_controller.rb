class TicketsController < ApplicationController
  def new

  end

  def create
    @email = params[:email]
    @ticket = create_ticket
  end

  def index
    @tickets = client.tickets(current_user.email)
  end

  def show
    @id = params[:id]
    @comments = client.requests.find(:id => @id).comments
  end

  def update
    @id = params[:id]
    @comment = params[:comment]

    @update = client.requests.find(:id => @id)
    @update.comment = { :description => @comment}
    @update.save

    redirect_to ticket_path(@id)
  end

  private

  def create_ticket
    options = {:subject => params[:subject], :comment => { :value => params[:description] }, :requester => { :email => @email, :name => params[:full_name] }}
    if params[:subject].blank? or params[:description].blank? or params[:email].blank?
      flash[:alert] = "Please complete all fields."
      redirect_to new_ticket_path
    else
      ZendeskAPI::Ticket.create(client, options)
    end

  end
end
