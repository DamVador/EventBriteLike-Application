Rails.application.routes.draw do
  get 'images/create'
  resources :charges
  devise_for :users
  resources :users, only: [:show] do
    resources :images, only: [:create]
  end
  resources :events
  resources :attendances
  root :to => "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
