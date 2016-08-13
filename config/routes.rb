Rails.application.routes.draw do
  resources :categories
  resources :posts
  resources :fanpages

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'search' , to: 'fanpages#search'
  root to: 'fanpages#home'
end
