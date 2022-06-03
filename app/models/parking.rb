class Parking < ApplicationRecord
  belongs_to :employee
  belongs_to :customer
  has_one :slot
end
