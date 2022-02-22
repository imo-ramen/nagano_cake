class Admin::OrdersController < ApplicationController

 def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
 end

 def update
    @order = Order.find(params[:id])
      @order.update(order_params)
      if params[:order][:status] == "入金確認"
        @order.order_details.update(making_status:1)
      end
    redirect_to request.referer
 end


 private
  # ストロングパラメータ
  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method, :status)
  end
end
