Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "chains#index"

  get "/data", to: "data#new"

  resources :interfaces
  
  resources :chains do
    post "/train", to: "chains#train"
    resources :question, only: %i[create]
    resources :teach, only: %i[create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do 
      resources :chains, only: %i[show] do
        resources :question, only: %i[create]
        resources :teach, only: %i[create]
      end
    end
  end
end
