class DashboardController < ApplicationController
  before_action :authenticate_employee!

  def index
    @parking = Parking.find(1)
    @slots = @parking.slots.find(1)
    @available_slots = @slots.total_space
  end
end