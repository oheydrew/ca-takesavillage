Rails.application.routes.draw do
  root 'events#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles

  resources :events do
    post :attend, on: :member
    post :unattend, on: :member
  end
  
end
