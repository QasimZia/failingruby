Rails.application.routes.draw do
  #session routes
  get '' => 'session#new'

  post 'session/create' => 'session#create'


  #users routes
  get 'profile' => 'users#index'
  
  get 'users/logout' => 'users#logout'

  get 'users/new' => 'users#new'

  post 'users/create' => 'users#create'

  get 'users/' => 'users#all'

  get 'users/:id' => 'users#show'

  #connections routes

  get 'create/:id' => 'connections#create'

  get 'accept/:id' => 'connections#accept'

  get 'deny/:id' => 'connections#deny'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
