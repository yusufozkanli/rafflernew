class Raffle < ApplicationRecord
  belongs_to :user

  has_many :orders

  validates :color, :description, :end_date, :ticket_quantity, :photo, presence: true

  mount_uploader :photo, PhotoUploader

  CATEGORIES = ['Electronics','Cars','Fashion','Jewelery', 'Experiences', 'Other']

end
