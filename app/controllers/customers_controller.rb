class CustomersController < ApplicationController
  
  def admit
    @customer = Customer.new
  end
  
  def show
    @customer = Customer.find(params[:id])
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      # Handle a successful save.
      flash[:info] = "Customer data saved."
      redirect_to @customer
    else
      render 'new'
    end
  end  

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:success] = "Confirmed Payment"
    redirect_to dashboard_url
  end

  private

    def customer_params
      params.require(:customer).permit(:plate_number, :vehicle_type, :client_type, :overnight)
    end  
end
