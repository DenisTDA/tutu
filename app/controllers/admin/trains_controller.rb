class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: %i[show edit update destroy set_current_station]


  def index
    @trains = Train.all
  end

  def show
  end

  def new
    @train = Train.new
  end

  def edit
  end

  def create
    @train = Train.new(train_params)
    @train.current_station = @train.route.railway_stations.first
    if @train.save
      redirect_to [:admin, @train], notice: 'Train was successfully created.'
    else
      render :new
    end
  end

  def update
    if @train.update(train_params)
      redirect_to [:admin, @train], notice: 'Train was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @train.destroy
    redirect_to admin_trains_url, notice: 'Train was successfully destroyed.'
  end

  def set_current_station
    @train.set_current_station(params[:current_station_id])
    redirect_to admin_train_url, notice: 'Train was successfully changed.'
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:number, :route_id, :sort_direct)
  end
end
