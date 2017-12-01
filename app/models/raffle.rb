class Raffle < ApplicationRecord
  belongs_to :user
  has_many :orders, dependent: :destroy
  validates :title, :description, :end_date, :ticket_quantity, presence: true
  after_create :set_winner_draw_job
  after_update :set_winner_draw_job
  mount_uploader :photo, PhotoUploader

  def time_left_in_seconds
    return r.end_date - Time.now
    # calculate the time between the current time and the end_date
    # return it as seconds
  end

  CATEGORIES = ['Electronics','Cars','Fashion','Jewelery', 'Experiences', 'Other']


  def set_winner_draw_job
    if self.status == "active"
      PickWinnerJob.set(wait_until: self.end_date).perform_later(self)
    end
  end

end
