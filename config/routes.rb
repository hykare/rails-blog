Rails.application.routes.draw do
  root 'articles#index'
  # get 'articles', to: 'articles#index'

  # # :id is a route parameter
  # # captures part of the path to params hash
  # get 'articles/:id', to: 'articles#show'

  resources :articles do
    resources :comments
  end
end
