class Raffle < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :title, :description, :end_date, :ticket_quantity, presence: true
  after_save :set_winner_draw_job

  mount_uploader :photo, PhotoUploader

  def time_left_in_seconds
    return r.end_date - Time.now
    # calculate the time between the current time and the end_date
    # return it as seconds
  end

  CATEGORIES = ['Electronics','Cars','Fashion','Jewelery', 'Experiences', 'Other']


  def set_winner_draw_job
    PickWinnerJob.set(wait_until: self.end_date).perform_later(self)
  end

  # while true do
  #   raffles = Raffle.where("end_date <= '#{Time.now}'")
  #   raffles.each do |raffle|
  #     x = draw_ticketnumber(raffle)
  #     update_order(x)
  #     raffle.status = "completed"
  #   end
  #   sleep 100
  # end

end
