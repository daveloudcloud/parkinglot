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
    Customer.get_end_time(@customer)
    
    @start_time = @customer.start_time
    @end_time = @customer.end_time
    
    # @end_time = @end_time + 90000

    @elapsed_time = @end_time - @start_time

    @hours =  @elapsed_time / 3600
    @minutes = @elapsed_time / 60 % 60
    @seconds =  @elapsed_time % 60
    
    Customer.compute_balance(@customer, @elapsed_time, @start_time, @end_time)

  end

  def update_slot
    customer = Customer.find_by(plate_number: params[:plate_number])
    Archive.create_archived_customer(customer)
    customer.destroy
    Slot.increase_slot
    redirect_to dashboard_url, notice: "Parking Slot now vacant"
  end
end
