Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  root 'time#index'

  resources :projects
  resources :time_entries, except: %i[index]
  resources :reports, only: %i[index]
  get '/reports/detailed', to: 'reports#detailed', as: 'detailed_reports'

  get '/time', to: 'time#index'
  get '/time/:view/:year/:month/:day', to: 'time#index'
  get '/time/day/duration', to: 'time#day_duration'
  get '/time/week/duration', to: 'time#week_duration'

  namespace 'api/v1', as: 'api_v1' do
    resources :groups
    resources :projects
    resources :time_entries
  end
end
