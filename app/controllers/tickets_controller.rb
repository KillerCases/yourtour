require 'zendesk_api'
require 'json'

class TicketsController < ApplicationController
  def new
    if user_signed_in?
      #@profile = Profile.where(:email => current_user.email).first
      if @profile = Profile.where(:email => current_user.email).first
#         @game = @profile.games
      else
        []
      end
    end
  end

  def create
    @email = params[:email]
#     @game_name = Game.find(params[:game]).name if user_signed_in?
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
    options = {:subject => params[:subject], :comment => { :value => params[:description] }, :requester => { :email => @email, :name => params[:name] }}
    if params[:subject].blank? or params[:description].blank? or params[:email].blank?
      flash[:alert] = "Please complete all fields."
      redirect_to new_ticket_path
    else
#       options[:requester][:name] = params[:full_name]
          ZendeskAPI::Ticket.create(client, options)
    end

  end
end
