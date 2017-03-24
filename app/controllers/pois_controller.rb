class PoisController < ApplicationController
  def show
    @journey = Journey.find(params[:journey_id])
    @poi = @journey.journey_pois.find(params[:id])
    @diff_journey = @poi.poi.journeys

    # poi_id_toseek = @poi.poi_id

  #  @diff_journey.each do |journey|
    # acceder aux journey disposant du meme poi que journey_id
    # liste des journey disposant du meme poi

      #journey.journey_pois.where(poi_id: poi.poi_id)[0]
    #end
  end

  def index
  end

end
