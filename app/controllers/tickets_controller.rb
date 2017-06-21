class TicketsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :index]
  before_action :set_ticket, only: %i[ show destroy ]
  def index
    @tickets = current_user.tickets.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
  end

  def create
    @ticket = current_user.tickets.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_url
  end

  private
  def ticket_params
    params.require(:ticket).permit(:number, :passport, :train_id, 
      :passenger_name, :start_station_id, :end_station_id )
  end

  def set_ticket
    @ticket = current_user.tickets.find(params[:id])
  end

  def redirect_to_admin
    redirect_to admin_tickets_url if current_user.admin?    
  end
end
