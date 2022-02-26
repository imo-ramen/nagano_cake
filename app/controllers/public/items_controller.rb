class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: true).page(params[:page]).per(8)
  end

  def show
    @item = Item.find(params[:id])
    redirect_to items_path and return unless @item.is_active
    @cart_item = CartItem.new
  end

end
