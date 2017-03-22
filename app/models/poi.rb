class POI < ApplicationRecord
  has_many :journey_pois
  has_many :journeys, through: :journey_pois
end
