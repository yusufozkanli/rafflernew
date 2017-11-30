class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :raffles
  has_many :orders
  mount_uploader :photo, PhotoUploader
  after_create :send_welcome_email
  validates :name, presence: true

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver_now
  end

end
