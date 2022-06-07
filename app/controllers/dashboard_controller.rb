class DashboardController < ApplicationController
  before_action :authenticate_employee!

  def index
    @slots = Slot.first
    @available_slots = @slots.total_space
  end
end