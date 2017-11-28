class Order < ApplicationRecord
  belongs_to :raffle
  belongs_to :user
  has_one :command
  monetize :price_pennies
end
