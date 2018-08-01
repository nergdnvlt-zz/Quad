Rails.application.routes.draw do
  root 'welcome#index'

  get '/sessions', to: 'sessions#index'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
end
