Rails.application.routes.draw do
  get '/coops', to: 'coops#index'
  get '/coops/:id', to: 'coops#show'
  get '/chickens', to: 'chickens#index'
  get '/chickens/:id', to: 'chickens#show'
  get '/coops/:id/chickens', to: 'coop_chickens#index'
end
