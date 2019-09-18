Rails.application.routes.draw do
  get 'results/result'
  get 'results/pool', to: 'results#pool'
  get 'results/input', to: 'results#input'
  post 'results/input', to: 'results#update'
  get '/', to: 'schedules#top'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :users
  get 'signup', to: 'users#new'
  post 'signup', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'schedules/index', to: 'schedules#index'
  get 'schedules/country', to: 'schedules#country'
  post 'schedules/country', to: 'schedules#country_update'
  get 'schedules/ranking', to: 'schedules#ranking'
  get 'schedules/result', to: 'schedules#result'
  post 'schedules/selectranking', to: 'schedules#selectranking'
  post 'schedules/select', to: 'schedules#select'
  resources :account_activations, only: [:edit]
end
