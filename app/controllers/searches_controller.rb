class SearchesController < ApplicationController
  before_action :take_all_stations 

  def show
  end

  def create
    @trains = Train.search(params[:start_station_id], 
                                  params[:end_station_id])
    @start_station = RailwayStation.find(params[:start_station_id])
    @end_station = RailwayStation.find(params[:end_station_id])
    render :show
  end

  def edit
  end

  private
 
  def take_all_stations
    @all_stations = RailwayStation.all
  end
end
