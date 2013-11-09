class ItemsController < ApplicationController
  def new
    @item = Item.new(params[:item])
  end

  def create
    @item = current_user.items.build(params[:item])
    if @item.save
      redirect_to @item
    else
      render :new, @item
    end
  end
end
