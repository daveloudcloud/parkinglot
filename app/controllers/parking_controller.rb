class ParkingController < ApplicationController
  
  def admit
    @customer = Customer.new
    @employee = current_employee
    @slots = Slot.first
    @available_slots = @slots.total_space
  end
  
  def exit
  end    
  
  def search
    @customer = Customer.find_by(plate_number: params[:search])
    if @customer
      redirect_to @customer
    else
      redirect_to exit_url, notice: "Customer does not exist"
    end
    
  end

  def print_receipt
    @customer = Customer.find_by(plate_number: params[:plate_number])
    ending_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    @customer.update(end_time: ending_time)
  end

  def update_slot
    slot = Slot.find(1)
    total_space = slot.total_space
    Slot.update(total_space: total_space + 1)
    redirect_to dashboard_url, notice: "Parking Slot now vacant"
  end
end
