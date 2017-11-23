class Raffle < ApplicationRecord
  belongs_to :user

  has_many :orders

  validates :color, :description, :end_date, :ticket_quantity, :photo, presence: true

  mount_uploader :photo, PhotoUploader

  def time_left_in_seconds
    2345
    # calculate the time between the current time and the end_date
    # return it as seconds
  end
end
