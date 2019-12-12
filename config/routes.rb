Rails.application.routes.draw do
  root 'static#home'

  resources :set_up, only: :create
  resources :connects, only: :create
  get :callback, to: 'callback#callback'
end
