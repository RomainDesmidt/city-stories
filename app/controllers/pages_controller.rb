class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    redirect_to journeys_path
  end

  def test
  end

  def template
  end


  def value
    @result = []
    # POI name for user
    # Journey name for user
    # Poi content
    # User avatar


    POI.where(latitude: params[:pos]).each do |poi|
      @user = {}
      poi_id = poi.id
      poi.journeys.each do |journey|
        contenu = journey.journey_pois.where(poi_id: poi_id).first
        @user = {
          email: journey.user.email,
          journeyname: journey.name,
          poiname: contenu.name,
          poiphoto: contenu.photo.url,
          poivideo: contenu.video,
          poitext: contenu.text,
          poisound: contenu.sound,

        }
        @result << @user
      end
    end
    # @a = {lato: params[:pos]}
    render :json => @result
  end
end
