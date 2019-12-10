Rails.application.routes.draw do
  root 'static#home'

  resources :set_up, only: :create
end
