Otterflow::Application.routes.draw do
  resources :questions do
    resources :answers, :except => [:show, :index]
  end
  resources :users
  resources :categories
  resources :comments, :except => [:show, :index]
  resources :favorites, :only => [:create, :destroy] 
  resources :sessions, :only => [:new, :create] do
    collection do
      delete 'logout'
    end
  end
  resources :votes, :only => [:create, :destroy] 

  root to: 'questions#index'

  match 'new', to: 'questions#new_posts'
  match 'controversial', to: 'questions#controversial'
  match 'unanswered', to: 'questions#unanswered'
end
