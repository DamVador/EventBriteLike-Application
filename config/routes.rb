Rails.application.routes.draw do
  get 'attendances/new'
  get 'attendances/create'
  get 'attendances/show'
  get 'attendances/destroy'
  devise_for :users
  resources :users
  resources :events
  resources :attendances
  root :to => "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
