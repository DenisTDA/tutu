class CarriagesController < ApplicationController
  before_action :set_carriage, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create, :edit, :destroy, :show]

  def index
    @carriages = Carriage.all
  end

  def new
    @carriage = @train.carriages.new
  end

  def show
    named_view = @carriage.type.underscore.to_sym
    render named_view
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to @trainб notice: 'Вагон успешно создан'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to @carriage, notice: 'Вагон успешно обнавлен'
    else
      render :new
    end
  end

  def destroy
    @carriage.destroy
    redirect_to train_url(@train), notice: 'Вагон успешно удален'
  end

  private
  def carriage_params
    params.require(:carriage).permit(:number, :train_id, :top, 
                                    :bottom, :type, :side_bottom, 
                                    :side_top, :seats_place)
  end

  def set_carriage
    @carriage = Carriage.find(params[:id]).becomes(Carriage)
  end

   def set_train
    @train = Train.find(params[:train_id])
  end

end