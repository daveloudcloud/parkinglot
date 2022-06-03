class CustomersController < ApplicationController
  
  def admit
    @customer = Customer.new
  end
  
  def show
    @customer = Customer.find(params[:id])
    @parking = Parking.find(1)
    @slots = @parking.slots.find(1)
    @available_slots = @slots.total_space
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # Handle a successful save.
      redirect_to @customer, notice: "Customer Data Parked"
    else
      render 'new'
    end
  end  

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to dashboard_url, notice: "Confirmed Payment"
  end

  private

    def customer_params
      params.require(:customer).permit(:plate_number, :vehicle_type, :client_type, :overnight, :employee_email, :employee_id, :admittance_date, :admittance_time)
    end  
end
