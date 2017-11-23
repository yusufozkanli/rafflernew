class Raffle < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :color, :description, :end_date, :ticket_quantity, presence: true

  mount_uploader :photo, PhotoUploader

  def time_left_in_seconds
    return r.end_date - Time.now
    # calculate the time between the current time and the end_date
    # return it as seconds
  end

  CATEGORIES = ['Electronics','Cars','Fashion','Jewelery', 'Experiences', 'Other']
end
