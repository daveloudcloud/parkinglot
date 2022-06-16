class ReportsController < ApplicationController

  def personal_reports
    @employee = current_employee
    @customers = Customer.where(employee_id: @employee.id)
  end

  def company_reports
    @employees = Employee.all
    @customers = Customer.all
  end
end
