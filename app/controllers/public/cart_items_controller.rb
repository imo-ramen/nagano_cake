class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def create
    @cart_item = current_.cart_customer.items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to cart_items_path
    elsif 
      @cart_item.save
      @cart_items = current_member.cart_items.all
      render 'index'
    else
      render 'index'
    end 
  end 

  def destroy
    @cart_items = current_customer.cart_item.find(params[:id])
    @cart_items.destroy
    redirect_to request.referer
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to request.referer
  end


  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :price, :quantity, :amount)
  end
end
