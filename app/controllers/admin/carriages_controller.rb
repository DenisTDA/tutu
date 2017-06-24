class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: %i[show edit update destroy]
  before_action :set_train, only: [:new, :create]

  def index
    @carriages = Carriage.all
  end

  def new
    @carriage = Carriage.new
  end

  def show 
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to [:admin, @train]
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to [:admin, @carriage]
    else
      render :new
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_carriages_url
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

  def set_train
    @train = Train.find(params[:train_id])
  end
end
