Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [] do 
    resources :photos 
  end

 	resources :photos, only: [] do 
    resources :comments
  end

  get '/photos', to: 'photos#show_all'
  root 'photos#show_all'
end
