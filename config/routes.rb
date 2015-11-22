Rails.application.routes.draw do
  devise_for :users
  resources :courses
  root to: "home#index"
end
