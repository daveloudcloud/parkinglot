class Employees::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    if current_employee.present?
      return dashboard_path
    end
  end
end