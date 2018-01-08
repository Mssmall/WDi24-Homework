Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => 'countries#index'
  get '/countries/map' => 'countries#map', :as => 'country_map'
  
  get '/countries/new' => 'countries#new', :as => 'country_new'
  post '/countries/create' => 'countries#create', :as => 'country_create'

  get '/countries/:id' => 'countries#show', :as => 'country_show'
  get '/countries/:id/edit' => 'countries#edit', :as => 'country_edit'
  post '/countries/:id' => 'countries#update', :as => 'country_update'
  delete '/country/:id/' => 'countries#destroy', :as => 'country_destroy'








end
