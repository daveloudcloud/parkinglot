class Customer < ApplicationRecord
  has_many :parkings
  has_many :employees, through: :parkings

  validates :plate_number, presence: true
  validates :client_type, presence: true
end
