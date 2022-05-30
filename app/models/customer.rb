class Customer < ApplicationRecord
  has_many :parkings
  has_many :employees, :through => :parkings
end
