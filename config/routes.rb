Rails.application.routes.draw do
  

  

  get 'purchases/index'

  root "users#new"
  post '/users' => "users#create"
  get "/sessions/new" => "sessions#new"

  post "/sessions/create" =>"sessions#create"
  delete "/sessions/:id" => "sessions#destroy"

  get '/users/profile' =>"items#index"
  post '/items' => 'items#create'
  delete '/items/:id' => 'items#destroy'


  get '/allitems' => "purchases#index"
  post '/purchases/:id' => "purchases#create"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
