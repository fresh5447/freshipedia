Freshipedia::Application.routes.draw do

  get "welcome/index"
  get "welcome/about"

  devise_for :users

  resources :wikis do 
    resources :collaborators
  end

  Freshipedia::Application.routes.draw do
    resources :charges, only: [:new, :create]
  end
  
  #resources :users, only: [:show, :index]
  #TODO no routes match localhost:3000/welcome
  #match "about" => 'wikis#about', via: :get

  root to: 'welcome#index'
end
