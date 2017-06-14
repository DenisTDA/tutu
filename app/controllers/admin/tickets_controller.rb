class Admin::TicketsController < Admin::BaseController
  before_action :authenticate_user!, only: [:create, :update, :index]
  before_action :set_ticket, only: [ :show, :destroy, :edit, :update ]
  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
  end

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
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
    params.require(:ticket).permit(:number, :passport, :passenger_name, :user_id, 
                                  :train_id, :start_station_id, :end_station_id )
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
