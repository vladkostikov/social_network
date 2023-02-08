Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/:id', to: 'posts#show'
  root to: 'posts#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
