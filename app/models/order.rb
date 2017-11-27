class Order < ApplicationRecord
  belongs_to :raffle
  belongs_to :user
  monetize :price_pennies
end
