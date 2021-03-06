class JourneyPOI < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :journey
  belongs_to :poi
  validates :name, presence: true
end
