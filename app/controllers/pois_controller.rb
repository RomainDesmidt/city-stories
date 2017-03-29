 class PoisController < ApplicationController
  def show
    @poi = POI.find(params[:id])
    @journey = Journey.find(params[:journey_id])

    poi_position_for_journey = @journey.pois.index(@poi)

    @next_poi_for_journey = (poi_position_for_journey + 1) % @journey.pois.count
    @previous_poi_for_journey = (poi_position_for_journey - 1) % @journey.pois.count

    journey_position_for_poi = @poi.journeys.index(@journey)

    @next_journey_for_poi = (journey_position_for_poi + 1) % @poi.journeys.count
    @previous_journey_for_poi  = (journey_position_for_poi - 1) % @poi.journeys.count









    # poi_id_toseek = @poi.poi_id

  #  @diff_journey.each do |journey|
    # acceder aux journey disposant du meme poi que journey_id
    # liste des journey disposant du meme poi

      #journey.journey_pois.where(poi_id: poi.poi_id)[0  #end
  end

  def index
  end

end
