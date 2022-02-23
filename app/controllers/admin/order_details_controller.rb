class Admin::OrderDetailsController < ApplicationController

 def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_detail.update(order_detail_params)
    if params[:order_detail][:making_status] == "製作中"
      @order.update(status:2)
    else
      if @order.order_details.where(making_status:3).count == @order.order_details.count
        # 左がmaking_status:3のものはなんこあるか　＝　注文詳細の数のカウント
        @order.update(status:3)
      end
    end
    redirect_to request.referer
 end


 private

 def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
end
