class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :redirect_to_next_step_for_incomplete_user

  protected

  def after_sign_up_path_for(user)
    new_verification_path
  end
  
end