Rails.application.routes.draw do
  resources :fanpages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'fanpages#index'
end
