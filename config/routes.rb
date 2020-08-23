Rails.application.routes.draw do
  resources :sessions, only: [create]
  root to: 'static#home'
  resources :users do
    resources :assignments
  end

  resources :courses, only: [:index, :show]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
