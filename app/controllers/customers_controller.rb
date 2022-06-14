class CustomersController < ApplicationController
  
  def admit
    @customer = Customer.new
  end
  
  def show
    @customer = Customer.find(params[:id])
    @parking = Parking.where(customer_id: @customer.id)
    @slots = Slot.first
    @available_slots = @slots.total_space
  end

  def create
    @customer = Customer.new(customer_params)
    @slot = Slot.first
    @employee = current_employee
    if @customer.save
      # Handle a successful save.
      @customer.parkings.create(customer_id: @customer.id, employee_id: @employee.id, name: "Parking-Lot A")
      redirect_to @customer, notice: "Customer Data Parked"
    else
      render 'new'
    end
  end  

  def destroy
    @customer = Customer.find(params[:id])
    @parking = Parking.find_by(customer_id: @customer.id)
    @customer.destroy
    @parking.destroy
    redirect_to company_reports_url, notice: "Employee Data Removed"
  end

  private

    def customer_params
      params.require(:customer).permit(:plate_number, :vehicle_type, :client_type, :overnight, :employee_email, :employee_id, :admittance_date, :admittance_time)
    end  
end
