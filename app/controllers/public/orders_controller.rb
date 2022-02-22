class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      current_customer.cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.order_id = @order.id
        order_detail.item_id = cart_item.item_id
        order_detail.price = cart_item.item.price
        order_detail.amount = cart_item.amount
        order_detail.save
      end
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
  @shipping_cost = 800

    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @item =current_customer.cart_items
    if
      params[:order][:customer_address] == "a"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name

    elsif
      params[:order][:customer_address] == "b"
      @addresses = Address.find(params[:order][:address_id])
      @order.address = @addresses.address
      @order.postal_code = @addresses.postal_code
      @order.name = @addresses.name

    else
      params[:order][:customer_address] == "c"
    end
  end

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :address, :name, :postal_code, :shipping_cost, :status, :total_payment)
  end
end
