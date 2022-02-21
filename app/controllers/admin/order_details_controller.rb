class Admin::OrderDetailsController < ApplicationController
  
 def update
    @order_detail = Order_detail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if @order
      
    end
      redirect_to request.referer
 end
 
 
 private
 
 def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
