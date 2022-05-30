Rails.application.routes.draw do
  devise_for :employees, controllers: { sessions: 'employees/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :employee do
    root to: 'devise/sessions#new'
  end

  resources :employees, except: [:destroy]
  resources :customers
  get 'dashboard', to: 'dashboard#index'
  get 'admit', to: 'parking#admit'
  get 'exit', to: 'parking#exit'
  get 'reports', to: 'parking#reports'
end
