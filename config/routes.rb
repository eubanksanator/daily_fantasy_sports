Rails.application.routes.draw do
  root 'home#index'

  resources :datasets, only: [:index, :new, :create]
end
