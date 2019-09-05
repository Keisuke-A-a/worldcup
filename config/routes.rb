Rails.application.routes.draw do
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 resources :users
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'schedules/index', to: 'schedules#index'
  get 'schedules/ranking', to: 'schedules#ranking'
  post 'schedules/select', to: 'schedules#select'
  resources :account_activations, only: [:edit]
end
