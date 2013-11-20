class TransactionsController < ApplicationController
  def new
    @transaction = Item.find(params[:item_id]).transactions.build
  end

  def create
    @transaction = Item.find(params[:transaction][:item_id]).transactions.build(params[:transaction])
    @transaction.stripe_card_token = params[:stripe_card_token]
    if @transaction.save_with_card
      redirect_to root_path, notice: "Thank you for your purchase!"
    else
      render :new
    end
  end
end
