# == Route Map
#
#       Prefix Verb   URI Pattern                   Controller#Action
#    countries GET    /countries(.:format)          countries#index
#              POST   /countries(.:format)          countries#create
#  new_country GET    /countries/new(.:format)      countries#new
# edit_country GET    /countries/:id/edit(.:format) countries#edit
#      country GET    /countries/:id(.:format)      countries#show
#              PATCH  /countries/:id(.:format)      countries#update
#              PUT    /countries/:id(.:format)      countries#update
#              DELETE /countries/:id(.:format)      countries#destroy
#       cities GET    /cities(.:format)             cities#index
#              POST   /cities(.:format)             cities#create
#     new_city GET    /cities/new(.:format)         cities#new
#    edit_city GET    /cities/:id/edit(.:format)    cities#edit
#         city GET    /cities/:id(.:format)         cities#show
#              PATCH  /cities/:id(.:format)         cities#update
#              PUT    /cities/:id(.:format)         cities#update
#              DELETE /cities/:id(.:format)         cities#destroy
# 

Rails.application.routes.draw do

  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :countries
  resources :cities
end
