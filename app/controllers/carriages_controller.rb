class CarriagesController < ApplicationController
  before_action :set_carriage, only: %i[show edit update destroy]

  def index
    @carriages = Carriage.all
  end

  def new
    @carriage = Carriage.new
  end

  def show 
  end

  def create
    @carriage = Carriage.new(carriage_params)
    if @carriage.save
      redirect_to carriages_path(@carriage)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage
    else
      render :new
    end
  end

  def destroy
    @carriage.destroy
    redirect_to carriages_url
  end

  private

  def carriage_params
    params.require(:carriage).permit(:train_id, :top_place, :bottom_place,
                                     :side_top_place, :side_bottom_place,
                                     :number, :seats_place, :type)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id]).becomes(Carriage)
  end
end
