class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all#.page(params[:page])
    @order_items = OrderItem.all
  end
end
