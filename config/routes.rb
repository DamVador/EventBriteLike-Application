Rails.application.routes.draw do
  resources :charges
  devise_for :users
  resources :users, only: [:show] do
    resources :images, only: [:create]
  end
  resources :events do
    resources :charges, only: [:new, :create]
    resources :event_images, only: [:create]
  end
  resources :attendances
  root :to => "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
