class TransactionsController < ApplicationController
  def new
    @transaction = Item.find(params[:item_id]).transactions.build
  end
end
