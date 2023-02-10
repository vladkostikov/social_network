Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  get 'posts/:id', to: 'posts#show', constraints: { id: /\d+/ }
  get 'posts/new', to: 'posts#new'
  get 'posts/:topic', to: 'posts#topic'
  resources :posts, except: :destroy
  resource :comments, only: [:create]
end
