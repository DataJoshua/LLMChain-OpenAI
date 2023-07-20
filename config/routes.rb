Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root "data#index"

  get "/data", to: "data#new"

  resources :chains 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do 
      resources :data, only: %i[create]
      post "ask", to: "data#ask"  
    end
  end
end
