class Employees::RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    if current_employee.present?
      return dashboard_path
    end
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      # Handle a successful save.
      redirect_to dashboard_url, notice: "New Employee Created"
    else
      render 'new'
    end
  end  

  private

    def employee_params
      params.require(:employee).permit(:email, :name, :admin, :password, :password_confirmation)
    end  
end