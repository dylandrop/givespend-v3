GivespendV3::Application.routes.draw do
  resources :verifications, only: [:new, :create]

  devise_for :users, :controllers => { :registrations => "registrations" }

  get "pages/index"

  get "pages/about"

  get "pages/contact"

  root to: "pages#index"

end
