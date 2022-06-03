class ParkingController < ApplicationController
  
  def admit
    @customer = Customer.new
    @employee = current_employee
    @parking = Parking.find(1)
    @slots = @parking.slots.find(1)
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
    slot = Slot.find(1)
    total_space = slot.total_space
    Slot.update(total_space: total_space+1)
  end
end
