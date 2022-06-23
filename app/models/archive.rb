class Archive < ApplicationRecord
  scope :this_month, -> { where(created_at: Date.today.all_month) }
  scope :this_year, -> { where(created_at: Date.today.year) }
  def self.create_archived_customer(customer)
    Archive.create(
      id: customer.id, 
      plate_number: customer.plate_number, 
      vehicle_type: customer.vehicle_type, 
      client_type: customer.client_type,
      overnight: customer.overnight,
      employee_email: customer.employee_email,
      employee_id: customer.employee_id,
      admittance_time: customer.admittance_time,
      admittance_date: customer.admittance_date,
      exit_time: customer.exit_time,
      exit_date: customer.exit_date,
      amount_paid: customer.balance
    )
    parking = Parking.find_by(id: customer.id)
    parking.destroy
  end
end
