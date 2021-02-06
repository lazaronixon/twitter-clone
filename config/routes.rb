Rails.application.routes.draw do
  resources :tweets, only: %i[ index new create ]

  # Authentication
  get    "sign_in",  to: "sessions#new"
  post   "sign_in",  to: "sessions#create"
  delete "sign_out", to: "sessions#destroy"

  # Root
  root "tweets#index"
end
