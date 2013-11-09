class ItemsController < ApplicationController
  layout 'no_columns', only: :show
  def new
    @item = Item.new(params[:item])
    @item.build_image
  end

  def create
    @item = current_user.items.build(params[:item])
    if @item.save
      redirect_to @item
    else
      render :new, @item
    end
  end

  def show
    @item = Item.find(params[:id])
  end
end
