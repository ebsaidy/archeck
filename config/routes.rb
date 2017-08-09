Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login'   => 'sessions#new'
  get 'signup'   	=> 'users#new'
  get 'login'	 	=> 'sessions#new'
  post'login'	 	=> 'sessions#create'
  delete 'logout' 	=> 'sessions#destroy'
  
  get 'games/add_game'
  post 'games/add_game'
  get 'games/new'
  get 'games/index'
  get 'games/add_balls'
  get 'games/get_balls'
  post 'games/winning_balls'
  post 'games/update'
  get 'games/edit_balls'
  post 'games/update_balls'
  get 'tickets/index'
  
resources :users
resources :games
resources :tickets
end
