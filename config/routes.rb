Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "pages#start"

  get "/submitted", to: "pages#submitted"
  get "/ineligible", to: "pages#ineligible"

  namespace :applicants do
    resources :application_routes, only: %i[new create]
    resources :school_details, only: %i[new create]
    resources :contract_details, only: %i[new create]
    resources :contract_start_dates, only: %i[new create]
    resources :subjects, only: %i[new create]
    resources :teaching_details, only: %i[new create]
    resources :visas, only: %i[new create]
    resources :entry_dates, only: %i[new create]
    resources :personal_details, only: %i[new create]
    resources :employment_details, only: %i[new create]
    resources :salaried_course_details, only: %i[new create]
  end

  # TODO: route constraint, only signed-in admins should be able to access
  scope module: :system_admin, path: "system-admin" do
    resources :applicants, only: %i[index show edit update]
  end
end
