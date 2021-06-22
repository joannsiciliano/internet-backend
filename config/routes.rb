Rails.application.routes.draw do
  resources :social_media_posts
  resources :voids
  resources :moods
  resources :users
  resources :messages, only: [:index, :create]
  mount ActionCable.server => '/cable'
  post "/login", to: "users#login"
  get '/profile', to: "users#profile"
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
