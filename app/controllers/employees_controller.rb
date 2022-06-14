class EmployeesController < ApplicationController

  def new_employee
    @employee = Employee.new
  end

  def show
  end


  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      # Handle a successful save.
      redirect_to dashboard_url, notice: "Employee account created"
    else
      render 'new'
    end
  end    

  def destroy
    @employee = Employee.find(params[:id])    
    @employee.destroy
    redirect_to company_reports_url, notice: "Employee Data Removed"
  end

  private

    def employee_params
      params.require(:employee).permit(:email, :name, :admin, :password, :password_confirmation)
    end    
end