class AuthenticationsController < Devise::OmniauthCallbacksController
  def stripe_connect
    omniauth = request.env["omniauth.auth"]
    current_user.apply_omniauth(omniauth)
    current_user.save!
    redirect_to new_item_path
  end
end