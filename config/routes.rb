Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#start"

  get "/submitted", to: "pages#submitted"
  get "/ineligible", to: "pages#ineligible"

  namespace :applicants do
    resources :application_types, only: %i[new create]
    resources :school_eligibilities, only: %i[new create]
    resources :contract_eligibilities, only: %i[new create]
    resources :contract_start_dates, only: %i[new create]
    resources :personal_details, only: %i[new create]
    resources :employment_details, only: %i[new create]
  end
end
