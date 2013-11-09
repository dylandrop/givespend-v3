class SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(user)
    if current_user.secret_key.present?
      current_user.items.empty? ? new_item_path : root_path
    else
      new_verification_path
    end
  end
end