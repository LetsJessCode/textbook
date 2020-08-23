Rails.application.routes.draw do
  
  resources :users do
    resources :assignments
  end
  
  resources :courses, only: [:index, :show]
  root to: 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
