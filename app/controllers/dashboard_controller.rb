class DashboardController < ApplicationController
  before_action :authenticate_employee!
end