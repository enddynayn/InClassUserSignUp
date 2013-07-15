InClassUserSignUp::Application.routes.draw do
  
 
  get "privacy" => 'site#privacy'
  get "terms" => 'site#terms'
  get "login" => 'sessions#new'
  resource :session, only: [ :new, :create, :destroy]

  root 'site#index'
  
end
