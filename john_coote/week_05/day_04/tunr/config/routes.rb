Rails.application.routes.draw do



  root :to => "pages#home"

  resources :users, :only => [:index, :new, :create, :edit, :update]

  # ? not strictly CRUD - there's no model for session
  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
