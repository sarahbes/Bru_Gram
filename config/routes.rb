Rails.application.routes.draw do
  devise_for :users

  resources :users do 
    resources :photos 
  end

  get '/photos', to: 'photos#show_all'
  root 'photos#show_all'
end
