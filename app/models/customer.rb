class Customer < ApplicationRecord
  has_many :parkings
  has_many :employees, through: :parkings

  validates :plate_number, presence: true
  validates :client_type, presence: true

  def self.get_end_time(customer)
    if customer.end_time.nil?
      customer.update(exit_time: Time.now.strftime("%I:%M"), exit_date: DateTime.current.to_date)
      ending_time = Time.now.to_i - Date.today.to_time.to_i
      customer.update(end_time: ending_time)
    end
  end

  def self.compute_balance(customer, elapsed_time, start_time, end_time)
    
    
    
    if elapsed_time <= 86400
      balance = 35
      initial_hours = 14400
      (initial_hours...end_time).step(3600) do |hour|
        if elapsed_time > hour
          balance = balance + 10
        end
      end
    end

    if elapsed_time > 86400
      balance = 185
      initial_hours = 36000
      (initial_hours...end_time).step(3600) do |hour|
        if elapsed_time > hour
          balance = balance + 10
        end
      end      
    end

    customer.update(balance: balance)
   
  end
end
