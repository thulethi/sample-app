Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  root              to: 'home#home'
  get    'signup'   =>  'users#new'
  get    'login'    =>  'sessions#new'
  post   'login'    =>  'sessions#create'
  delete 'logout'   =>  'sessions#destroy'
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
