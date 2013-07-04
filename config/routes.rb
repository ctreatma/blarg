Blarg::Application.routes.draw do
  get 'log_in' => 'sessions#new', :as => :log_in
  get 'log_out' => 'sessions#destroy', :as => :log_out
  resources :sessions, :only => :create
  resources :posts, only: [:index, :show]
  root to: 'posts#index'
end
