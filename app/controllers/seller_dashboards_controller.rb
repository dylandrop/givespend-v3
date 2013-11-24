class SellerDashboardsController < ApplicationController
  before_filter :authenticate_user!

  def show
    @transactions = Transaction.includes(:item).where("items.user_id = ?", current_user.id).order("transactions.created_at DESC")
  end
end
