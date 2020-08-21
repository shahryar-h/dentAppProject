Rails.application.routes.draw do
  


  get 'admins/index'

  get 'sessions/new'

  root 'static_pages#home'
  get 'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  resources :patients
  resources :treatments, :except => [:index]
  
end
