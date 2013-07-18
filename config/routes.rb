Otterflow::Application.routes.draw do
  resources :questions do
    resources :answers, :except => [:show, :index]
  end
  resources :users
  resources :categories
  resources :comments, :except => [:show, :index]
  resources :favorites, :only => [:new, :create, :destroy] 
  resources :sessions, :only => [:create, :destroy]
end
