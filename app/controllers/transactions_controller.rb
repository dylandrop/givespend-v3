class TransactionsController < ApplicationController
  def new
    @transaction = Item.find(params[:item_id]).transactions.build
  end

  def create
    @transaction = Item.find(params[:transaction][:item_id]).transactions.build
    @transaction.stripe_card_token = params[:stripe_card_token]
    @transaction.email = params[:email]
    if @transaction.save_with_card
      redirect_to root_path, notice: "Thank you for your purchase!"
    else
      render :new, error: "Something went wrong!"
    end
  end
end
