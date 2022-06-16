Rails.application.routes.draw do
  devise_for :employees, controllers: { sessions: 'employees/sessions', registrations: 'employees/registrations' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :employee do
    root to: 'devise/sessions#new'
  end

  resources :employees
  resources :customers
  resources :slots
  get 'create_new_employee', to: 'employees#new_employee'
  get 'dashboard', to: 'dashboard#index'
  get 'admit', to: 'parking#admit'
  get 'exit', to: 'parking#exit'
  get 'search', to: 'parking#search'
  get 'print_receipt', to: 'parking#print_receipt'
  get 'personal_reports', to: 'reports#personal_reports'
  get 'company_reports', to: 'reports#company_reports'
  get 'confirm_payment', to: 'parking#update_slot'
end
