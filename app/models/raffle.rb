class Raffle < ApplicationRecord
  belongs_to :user
  has_many :orders
  mount_uploader :photo, PhotoUploader
end
