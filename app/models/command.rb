class Command < ApplicationRecord
  belongs_to :order
  monetize :amount_pennies
end
