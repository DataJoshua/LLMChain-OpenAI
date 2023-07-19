Rails.application.routes.draw do

  root "data#index"

  get "/data", to: "data#new"

  post "/data", to: "data#create"
  post "/ask", to: "data#ask"
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
