Rails.application.routes.draw do
  root 'welcome#index'

  get '/login', to: 'sessions#new', as: 'login'
end
