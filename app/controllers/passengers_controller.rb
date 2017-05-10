class PassengersController < ApplicationController
  before_action :set_passenger, only: [:show, :edit, :update, :destroy]
  def index
    @passengers = Passenger.all
  end

  def new
    @passenger = Passenger.new
  end

  def show    
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      redirect_to @passenger
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @passenger.update(passenger_params)
      redirect_to @passenger
    else
      render :new
    end
  end

  def destroy
    @passenger.destroy
    redirect_to passengers_url
  end

  private
  def passenger_params
    params.require(:passenger).permit(:name, :lastname)    
  end

  def set_passenger
    @passenger = Passenger.find(params[:id])
  end

end