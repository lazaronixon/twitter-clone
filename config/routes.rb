Rails.application.routes.draw do
  resources :users, only: :show do
    scope module: :users do
      resource :follow,    only: :create
      resource :following, only: :show
      resource :followers, only: :show
    end
  end

  resources :relationships, only: %i[ new create ]
  resources :tweets,        only: %i[ index new create ]

  # Authentication
  get  "sign_up", to: "registrations#new"
  post "sign_up", to: "registrations#create"

  get  "sign_in",  to: "sessions#new"
  post "sign_in",  to: "sessions#create"

  delete "sign_out", to: "sessions#destroy"

  # Username
  get '/:username', to: 'users#show', as: "username"

  # Root
  root "tweets#index"
end
