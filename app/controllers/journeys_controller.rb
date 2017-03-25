class JourneysController < ApplicationController
  def index
    @coordinates_hash = []
    @journeys = Journey.all
    @journeys.each do |journey|
    @coordinates_array = []
      journey.pois.each do |poi|
        latitude = poi.latitude
        longitude = poi.longitude
        @coordinates_array << [latitude , longitude]
      end
      @coordinates_hash << @coordinates_array
    end
  end

  def show


  end


end

