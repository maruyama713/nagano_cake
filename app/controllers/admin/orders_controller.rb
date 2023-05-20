class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @order_total = @order.billing_amount
  end
end
