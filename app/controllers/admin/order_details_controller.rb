class Admin::OrderDetailsController < ApplicationController

 def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if params[:order_detail][:making_status] == "製作中"
      @order.update(status:2)
    else
      params[:order_detail][:making_status] == "製作完了"
      @order.update(status:3)
    end
    redirect_to request.referer
 end


 private

 def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
