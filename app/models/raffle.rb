class Raffle < ApplicationRecord
  belongs_to :user
  has_many :orders
  validates :title, :description, :end_date, :ticket_quantity, presence: true

  mount_uploader :photo, PhotoUploader

  def time_left_in_seconds
    return r.end_date - Time.now
    # calculate the time between the current time and the end_date
    # return it as seconds
  end

  CATEGORIES = ['Electronics','Cars','Fashion','Jewelery', 'Experiences', 'Other']


  #### WINNING ALGORITHM #####

  def draw_ticketnumber(raffle)
    raffle_tickets = []
    raffle.orders each do |o|
      raffle_tickets << o.ticket_number
    end
    x = raffle_tickets.length - 1
    return raffle_tickets[rand(0..x)]
  end


  def update_order(x)
    order = Order.where("ticket_number = '#{x}'").first
    order.won = true
    order.save
    return order
    # The person who has won will receive an email.
  end


  while true do
    raffles = Raffle.where("end_date <= '#{Time.now}'")
    raffles.each do |raffle|
      x = draw_ticketnumber(raffle)
      update_order(x)
      raffle.status = "completed"
    end
    sleep 100
  end

end
