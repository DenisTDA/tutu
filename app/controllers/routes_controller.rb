class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def show    
  end

  def create
    @route = Route.new(route_params)
    @route.ordering
    if @route.save
      redirect_to @route
    else
      render :new
    end
  end

  def edit
  end

  def update
    @route.ordering
    if @route.update(route_params)
      redirect_to @route
    else
      render :new
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_url
  end

  private
  def route_params
    params.require(:route).permit(:name, railway_station_ids: [])
  end

  def set_route
    @route = Route.find(params[:id])
  end

end