class Order < ApplicationRecord
  belongs_to :raffle
  belongs_to :user
end
