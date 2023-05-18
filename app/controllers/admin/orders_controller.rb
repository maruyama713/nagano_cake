class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @order = Order.find(params[:id])
    @order_items = @customer.order_ids
    @order_total = @cart_items.inject(0){|sum,item| sum + item.subtotal}
  end
end
