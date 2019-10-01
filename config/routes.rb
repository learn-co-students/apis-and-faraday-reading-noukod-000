Rails.application.routes.draw do
  resources :users
  root 'searches#search'
  get '/search', to: 'searches#search'
  post '/search', to: 'searches#foursquare'
end
