Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/hello' => 'pages#hello'
  get '/about' => 'pages#about'
  get '/faq' => 'pages#faq'
  root :to => 'pages#hello'

  get '/auto:color' => 'auto#color'
  
end
