Blarg::Application.routes.draw do
  get 'log_in' => 'sessions#new', :as => :log_in
  get 'log_out' => 'sessions#destroy', :as => :log_out
  resources :sessions, only: :create
  scope module: 'admin' do
    resources :posts, except: [:index, :show]
  end
  resources :posts, only: [:index, :show]
  get ':slug' => 'posts#show_by_slug'
  root to: 'posts#index'
end
