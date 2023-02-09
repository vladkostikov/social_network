Rails.application.routes.draw do
  root to: 'posts#index'
  get 'posts/:id', to: 'posts#show', constraints: { id: /\d+/ }
  get 'posts/:topic', to: 'posts#topic'
  resources :posts, except: :destroy
end
