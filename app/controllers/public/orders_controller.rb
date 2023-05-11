class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirmation
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.address_name = current_customer.first_name + current_customer.last_name
  end
  
  def index
  end
  
  def show
  end
  
  private
  def order_params
    params.require(:order).permit(:method_of_payment, :postal_code, :address, :address_name)
  end
end
