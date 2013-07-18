Otterflow::Application.routes.draw do
  resources :questions do
    resources :answers, :except => [:show, :index]
  end
  resources :users
  resources :categories
  resources :comments, :except => [:show, :index]
  resources :favorites, :only => [:create, :destroy] 
  resources :sessions, :only => [:create, :destroy]
  resources :votes, :only => [:create, :destroy] 

  root to: 'questions#index'
end
