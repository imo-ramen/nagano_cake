class Admin::OrdersController < ApplicationController

 def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
 end

 def update
    @order = Order.find(params[:id])
      @order.update(order_params)
      if params[:order][:status]

      redirect_to request.referer
      end
 end

 private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method, :status)
  end
end
