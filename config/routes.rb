Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/new', to: 'posts#new'
  get 'posts/:id', to: 'posts#show'
  post 'posts/create', to: 'posts#create'

  root to: 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
