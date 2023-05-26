class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_total = @order.billing_amount
  end
end
