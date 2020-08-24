Rails.application.routes.draw do
root to: 'static#home'
 
get "/signup", to: "users#new", as: "signup" #(signup path)
post "/signup", to: "users#create"

get "login", to: "sessions#new", as: "login"
post "/login", to: "sessions#create"

delete "/logout", to: "sessions#destroy", as: "logout"
  # resources :sessions, only: [create]
  resources :courses, only: [:index, :show]

  resources :users do
    resources :assignments
  end
get 'auth/:provider/callback', to: 'sessions#omniauth'


  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
