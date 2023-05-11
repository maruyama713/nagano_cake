class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end
  
  def confirmation
    if params[:order][:select_addresses] == "0"
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_addresses] == "1"
      @order = Order.new(order_params)
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.address_name = @address.name
    elsif params[:order][:select_addresses] == "2"
      @order = Order.new(order_params)
    else
      render 'new'
    end
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
