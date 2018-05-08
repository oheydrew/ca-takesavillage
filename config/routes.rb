Rails.application.routes.draw do
  root 'static#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles

  resources :events do
    post :attend, on: :member
    post :unattend, on: :member
  end


  get 'contact', to: 'static#contact'
  get 'donate', to: 'static#donate'

  post 'checkout', to: 'payments#checkout'

  resources :payments, only: [:new, :create]


end
