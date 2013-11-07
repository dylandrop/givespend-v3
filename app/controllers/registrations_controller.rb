class RegistrationsController < Devise::RegistrationsController
  prepend_before_filter :require_no_authentication, :redirect_to_next_step_for_incomplete_user

  protected

  def after_sign_up_path_for(user)
    new_verification_path
  end

  private

  def redirect_to_next_step_for_incomplete_user
    return unless current_user
    redirect_to(new_verification_path) unless current_user.secret_key
    redirect_to(new_item_path) if current_user.items.empty?
  end

end