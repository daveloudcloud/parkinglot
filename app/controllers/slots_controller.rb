class SlotsController < ApplicationController
  def update
    slot = Slot.find(1)
    total_space = slot.total_space
    Slot.update(total_space: total_space-1)
    redirect_to dashboard_url, notice: "Reference Printed!"
  end
end