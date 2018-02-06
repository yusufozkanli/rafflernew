class Subscriber < ApplicationRecord
  validates :name, :email, presence: true
end
