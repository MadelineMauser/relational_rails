Rails.application.routes.draw do
  get '/coops', to: 'coops#index'
  get '/coops/:id', to: 'coops#show'
end
