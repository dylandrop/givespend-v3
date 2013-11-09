class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def redirect_to_next_step_for_incomplete_user
    return unless current_user
    redirect_to(new_verification_path) unless current_user.secret_key
    redirect_to(new_item_path) if current_user.items.empty?
  end
end
