class ReportsController < ApplicationController

  def personal_reports
    @employee = current_employee
    @customers = Customer.where(employee_id: @employee.id)
    @archived_customers = Archive.where(employee_id: @employee.id)
  end

  def company_reports
    @employees = Employee.all
    @customers = Customer.all
    @archived = Archive.all
  end

  def income_reports
  end

  def daily_reports
    @customers = Customer.where(:created_at => Time.now.beginning_of_day..Time.now.end_of_day)
    @archived = Archive.where(:created_at => Time.now.beginning_of_day..Time.now.end_of_day)

    balance = 0

    @archived.each do |ar|
      balance = balance + ar.amount_paid
    end

    @total_income_today = balance
  end

  def monthly_reports
    @archived_this_month = Archive.this_month

    balance = 0

    @archived_this_month.each do |ar|
      balance = balance + ar.amount_paid
    end

    @total_income_this_month = balance
  end

  def yearly_reports
    @archived_this_year = Archive.this_month

    balance = 0

    @archived_this_year.each do |ar|
      balance = balance + ar.amount_paid
    end

    @total_income_this_year = balance
  end  
end
