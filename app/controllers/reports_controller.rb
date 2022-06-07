class ReportsController < ApplicationController

  def show
    @employee = current_employee
    @customers = Customer.where(employee_id: @employee.id)
  end
end
