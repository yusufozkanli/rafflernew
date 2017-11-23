class Raffle < ApplicationRecord
  belongs_to :user

  has_many :orders

  validates :color, :description, :end_date, :ticket_quantity, :photo, presence: true

  mount_uploader :photo, PhotoUploader

  include PgSearch
  pg_search_scope :search, against: [ :category_name, :brand, :model ]

end
