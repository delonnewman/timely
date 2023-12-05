Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'time#index'

  resources :projects
  resources :time_entries, except: %i[index]

  get '/time', to: 'time#index'
  get '/time/:view/:year/:month/:day', to: 'time#index'
end
