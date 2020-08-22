Rails.application.routes.draw do
  resources :assignments
  resources :users
  resources :courses
  root to: 'static#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
