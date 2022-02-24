class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  before_action :blank_or_not_active, only: [:create]

  def index
    @cart_items = current_customer.cart_items
  end

  def create
    # 質問する:cart_item？
    redirect_to request.referer and return if params[:cart_item][:amount].blank?
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update(amount:new_amount)
        @cart_item.destroy
      end
    end
    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_items = CartItem.find(params[:id])
    if @cart_items.update(cart_item_params)
      redirect_to request.referer,notice: "You have updated user successfully."
    end
  end

  def destroy
    cart_items = CartItem.find(params[:id])
    cart_items.destroy
    redirect_to request.referer
  end

  def destroy_all
    cart_items = CartItem.all
    cart_items.destroy_all
    redirect_to request.referer
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
  
  def blank_or_not_active
    redirect_to request.referer and return unless Item.find(params[:item_id]).is_active #なくてもいい
    redirect_to request.referer and return if params[:cart_item][:amount].blank?
  end
end
