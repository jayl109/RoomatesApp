Rails.application.routes.draw do


  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  get "/rooms/setup", to: "rooms#setup", as: "setup"
  root to: "rooms#display", as: "display"
  post "/rooms/create", to: "rooms#create"
  post "/users/delete_room", to: "users#delete_room", as: "delete_room"
  post "/rooms/join", to: "rooms#join"
  get "/list/join", to: "lists#view", as: "grocery_list"
  post "/lists/create", to:"lists#create", as: "create_grocery"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
