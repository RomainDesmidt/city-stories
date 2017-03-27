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
    @poi = POI.all
    @a = {}
    @a = {lato: params[:pos], c: "d"}
    render :json => @a
  end
end
