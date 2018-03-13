class Order < ApplicationRecord
  belongs_to :raffle
  belongs_to :user
  has_one :command, dependent: :destroy
  monetize :price_cents
end
