class SlotsController < ApplicationController
  
  def decrease_slot
    Slot.decrease_slot
    redirect_to dashboard_url, notice: "Reference Printed!"
  end

  def increase_slot
    Slot.increase_slot
  end  
end