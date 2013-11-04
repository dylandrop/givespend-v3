GivespendV3::Application.routes.draw do
  devise_for :users

  get "pages/index"

  get "pages/about"

  get "pages/contact"

  root to: "pages#index"

end
