Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/' => 'pages#home'

  get '/test' => 'pages#test'

  get '/testing/testing' => 'testing#testing'
  get '/testing/testing/:num1/:num2/:operator' => 'testing#calculator'
  get '/testing/testing/a' => 'testing#calculator'

end
