Rails.application.routes.draw do
  resources :financial_instruments
  resources :banks
  resources :people
  resources :transactions

  namespace :cl do
    namespace :personal_banking do
      get :transactions
      get :income
      get :income_v2
      get :products
    end
    post '/banco_:bank_personas/:action', to: redirect { |path_paramas, _| "/cl/personal_banking/#{path_paramas[:action]}?bank=#{path_paramas[:bank_personas]}"}
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "banks#index"
end
