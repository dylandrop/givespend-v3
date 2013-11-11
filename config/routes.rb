GivespendV3::Application.routes.draw do
  resources :verifications, only: [:new]
  resources :items, only: [:new, :create, :show]
  resources :transactions, only: [:new, :create]
  devise_for :users, :controllers => { :registrations => "registrations", :omniauth_callbacks => "authentications", :sessions => "sessions" }

  get "pages/index"

  get "pages/about"

  get "pages/contact"

  root to: "pages#index"

end
