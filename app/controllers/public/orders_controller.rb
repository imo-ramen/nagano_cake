class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def create
    @orders = Order.new(order_params)
    @orders.customer_id = current_customer.id
    @orders.save
    current_customer.cart_items.destroy_all
    redirect_to complete_orders_path
  end

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id

    if
      params[:order][:customer_address] == "a"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name + current_customer.first_name

    elsif
      params[:order][:add_address] == "b"
      @addresses = Address.find(params[:order][:address_id])
      @order.address = @addresses.address
      @order.postal_code = @addresses.postal_code
      @order.name = @addresses.name

    else
      params[:order][:new_address] == "c"
    end
  end

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :address, :name, :postal_code, :shipping_cost, :status, :total_payment)
  end
end
