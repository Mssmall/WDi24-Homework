Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/magic/question' => 'pages#magic_question'
  get '/magic/answer' => 'pages#magic_answer'
  get '/magic' => 'pages#magic_question'

  get '/secret' => 'pages#secret_question'
  get '/secret/question' => 'pages#secret_question'
  get '/secret/answer' => 'pages#secret_answer'







  root :to => 'pages#home'

end
