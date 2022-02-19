class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save!
      redirect_to admin_item_path(@item.id)
    else
      render :new
    end
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
  end

  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :genre_id, :is_active)
  end
end
