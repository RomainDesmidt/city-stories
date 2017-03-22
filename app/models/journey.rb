class Journey < ApplicationRecord
  belongs_to :user
  has_many :journey_pois
  has_many :pois, through: :journey_pois
end
