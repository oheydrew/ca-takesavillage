Rails.application.routes.draw do
  root 'static#index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :profiles, only: [:show, :new, :create, :edit, :update]

  resources :events do
    post :attend, on: :member
    post :unattend, on: :member
  end

  get 'contact', to: 'static#contact'
  post '/contact', to: 'static#contact_email'

  get 'donate', to: 'static#donate'

  resources :payments, only: [:index, :new, :create]
  post 'charge', to: 'payments#charge'

end
