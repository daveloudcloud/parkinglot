class ParkingController < ApplicationController
  def admit
    @customer = Customer.new
  end
  def exit
  end
end
