class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [ :show, :destroy, :edit, :update ]
  before_action :set_environ, only: [:update, :edit] 

  def index
    @tickets = Ticket.all
  end

  def new
    @ticket = Ticket.new
    @train = Train.find(params[:train_id])
    @end_station, @start_station = RailwayStation.find(params.values_at(:start_station_id, :end_station_id))
  end

  def show
  end

  def create
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to [:admin, @ticket]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :new
    end
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_url
  end

  private
  def ticket_params
    params.require(:ticket).permit(:number, :passport, :passenger_name, :user_id, 
                                  :train_id, :start_station_id, :end_station_id )
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_environ
    @train = @ticket.train
    @end_station = @ticket.end_station
    @start_station = @ticket.start_station
  end
end
