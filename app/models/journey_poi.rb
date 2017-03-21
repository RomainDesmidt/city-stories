class JourneyPOI < ApplicationRecord
  belongs_to :journey
  belongs_to :poi
end
