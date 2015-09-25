Rails.application.routes.draw do
  root 'home#index'

  resources :datasets, only: [:index, :show, :new, :create]
end
