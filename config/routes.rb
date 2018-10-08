Rails.application.routes.draw do
  root to: 'users#new'
  get 'signup' =>'users#new'
  resources :users
end
