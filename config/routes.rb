Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#start"

  namespace :applicant do
    resources :school_eligibilities, only: %i[new create]
    resources :contract_eligibilities, only: %i[new create]
    resources :personal_details, only: %i[new create]
    resources :employment_details, only: %i[new create]
  end
end
