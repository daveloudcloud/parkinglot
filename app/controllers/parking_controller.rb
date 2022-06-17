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

    if @customer.end_time.nil?
      @customer.update(exit_time: Time.now.strftime("%I:%M"), exit_date: DateTime.current.to_date)
      ending_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      @customer.update(end_time: ending_time)
    end
    
    @start_time = @customer.start_time
    @end_time = @customer.end_time
    @elapsed_time = @end_time - @start_time

    @hours =  @elapsed_time / 3600
    @minutes = @elapsed_time / 60 % 60
    @seconds =  @elapsed_time % 60

    @balance = 0
    if @elapsed_time < 10800
      if @customer.overnight
        @customer.update(balance: @balance + 185.00)
      else
        @customer.update(balance: @balance + 35.00)
      end
    end


  end

  def update_slot
    @customer = Customer.find_by(plate_number: params[:plate_number])
    
    Archive.create(
      id: @customer.id, 
      plate_number: @customer.plate_number, 
      vehicle_type: @customer.vehicle_type, 
      client_type: @customer.client_type,
      overnight: @customer.overnight,
      employee_email: @customer.employee_email,
      employee_id: @customer.employee_id,
      admittance_time: @customer.admittance_time,
      admittance_date: @customer.admittance_date,
      exit_time: @customer.exit_time,
      exit_date: @customer.exit_date,
      amount_paid: @customer.balance
    )

    @customer.destroy

    slot = Slot.find(1)
    total_space = slot.total_space
    Slot.update(total_space: total_space + 1)
    redirect_to dashboard_url, notice: "Parking Slot now vacant"
  end
end
