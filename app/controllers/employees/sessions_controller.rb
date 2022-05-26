class Employees::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    dashboard_index_path
  end

  # def after_sign_out_path_for(resource_or_scope)
  #   root_url
  # end
end