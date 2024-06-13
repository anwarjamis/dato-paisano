Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get 'about', to: 'pages#about'
  get 'my_businesses', to: 'businesses#my_businesses'
  get 'success', to: 'pages#success'
  get 'thanks', to: 'pages#thanks'
  resources :users, only: %i[show edit update]
  resources :businesses
  resources :suggestions, only: %i[new create]
end
