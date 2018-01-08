Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'planets#index' #shows all planets
  get '/planets' => 'planets#index' #shows all planets


  get '/planets/new' => 'planets#new' #make a new planet
  post '/planets' => 'planets#create'

  get '/planets/:id' => 'planets#show', :as => 'planet'
  get '/planets/:id/edit' => 'planets#edit', :as => 'planet_edit'
  delete '/planets/:id' => 'planets#destroy'

  post '/planets/:id' => 'planets#update'

end
