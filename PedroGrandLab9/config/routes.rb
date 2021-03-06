Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/persons', to: "persons#index"
  post '/persons', to: "persons#create"
  get '/categories', to: "category#index"
  get '/new_category', to: "category#new"
  post '/categories', to: "category#create"
  get '/movies', to: "movies#index"
  get '/movies/new', to: "movies#new"
  post '/movies', to: "movies#create"
  post '/create_actor', to: "persons#new_actor"

end
