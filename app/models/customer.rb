class Customer < ApplicationRecord
  has_many :parkings
  has_many :employees, through: :parkings

  validates :plate_number, presence: true
  validates :client_type, presence: true

  def self.get_end_time(customer)
    if customer.end_time.nil?
      customer.update(exit_time: Time.now.strftime("%I:%M"), exit_date: DateTime.current.to_date)
      ending_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      customer.update(end_time: ending_time)
    end
  end

  def self.compute_balance(customer, elapsed_time, start_time, end_time)

    balance = 0

    if customer.overnight
      balance = balance + 185
      customer.update(balance: balance)
    else
      balance = balance + 35
      customer.update(balance: balance)
    end

    succeeding_times = 10800
   (succeeding_times...end_time).step(3600) do |t|
    if (elapsed_time > t)
      balance = balance + 10
    end
   end
   balance = balance - 10
   customer.update(balance: balance)
   
  end
end
