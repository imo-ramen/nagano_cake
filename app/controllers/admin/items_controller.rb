class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      #リダイレクトと同時にフラッシュメッセージの実装
      flash[:notice] = 'You have created item successfully'
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
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = 'You have updated item successfully.'
      redirect_to admin_item_path(@item.id)
    else
      render :edit
    end
  end

  private
  # ストロングパラメータ
  def item_params
    params.require(:item).permit(:item_image, :name, :introduction, :price, :genre_id, :is_active)
  end
end
