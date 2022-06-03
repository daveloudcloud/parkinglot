class ParkingController < ApplicationController
  
  def admit
    @customer = Customer.new
  end
  
  def exit
  end    
  
  def search
    @customer = Customer.find_by(plate_number: params[:search])
    if @customer
      redirect_to @customer
    end
    if @customer.nil? || @customer.blank?
      flash[:danger] = "Customer does not exist"
      render 'exit'   
    end
    
  end

  def print_receipt
    @customer = Customer.find_by(plate_number: params[:plate_number])
  end
end
