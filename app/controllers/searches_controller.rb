class SearchesController < ApplicationController
 # before_action :authenticate_user!, only: [:create]  
  def show
  end

  def create
   @trains = Train.search(search_params[:start_station_id], 
                                  search_params[:end_station_id])
    @start_station = RailwayStation.find(search_params[:start_station_id])
    @end_station = RailwayStation.find(search_params[:end_station_id])
    render :show
  end

  def edit
  end

  private
  def search_params
    params.require(:stations).permit(:start_station_id, :end_station_id)
  end
end
