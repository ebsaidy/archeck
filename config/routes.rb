Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root                 'static_pages#home'
  get 'login'   => 'sessions#new'
  get 'adduser'   	=> 'users#new'
  get 'login'	 	=> 'sessions#new'
  post'login'	 	=> 'sessions#create'
  delete 'logout' 	=> 'sessions#destroy'
  
  get 'webgames/add_game'
  post 'webgames/add_game'
  get 'webgames/new'
  get 'webgames/index'
  get 'webgames/add_balls'
  get 'webgames/get_balls'
  post 'webgames/winning_balls'
  post 'webgames/update'
  get 'webgames/edit_balls'
  post 'webgames/update_balls'
  get 'webgames/get_games'
  get 'webtickets/index'
  post 'games/add_game'
  get 'games/get_game'
  post 'games/winning_balls'
  get 'games/get_games'
  get 'games/edit'
  get 'games/edit_balls'
  post 'games/update'
  post 'games/update_balls'
  get 'games/get_balls'
  post 'games/destroy'
  post 'tickets/add_balls'
  get 'tickets/get_tickets'
  get 'tickets/search'
  post 'tickets/destroy'
  
resources :users
resources :webgames
resources :webtickets
resources :games
resources :tickets
end
