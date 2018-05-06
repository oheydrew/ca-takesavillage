Rails.application.routes.draw do
  root 'static#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles
  # get '/profile', to: 'profiles#show'

  resources :events

end
