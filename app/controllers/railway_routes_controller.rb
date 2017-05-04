class RailwayRoutesController < ApplicationController
  before_action :set_railway_route, only: [:show, :edit, :update, :destroy]
  def index
    @railway_routes = RailwayRoute.all
  end

  def new
    @railway_route = RailwayRoute.new
  end

  def show    
  end

  def create
    @railway_route = RailwayRoute.new(route_params)
    if @railway_route.save
      redirect_to @railway_route
    else
      render :new
    end
  end

  def edit
  end

  def update
      if @railway_route.update(route_params)
      redirect_to @railway_route
    else
      render :new
    end
  end

  def destroy
   
    @railway_route.destroy
    redirect_to railway_routes_path
  end

  private
  def route_params
    params.require(:railway_route).permit(:name)
  end

  def set_railway_route
    @railway_route = RailwayRoute.find(params[:id])
  end

end