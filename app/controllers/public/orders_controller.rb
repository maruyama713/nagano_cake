class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirmation
    @cart_items = current_customer.cart_items.all
    @postage = 800
    @total = @cart_items.inject(0){|sum,item| sum + item.subtotal}
    @billing_amount = @total + @postage
    if params[:order][:method_of_payment] == "0"
      @method_of_payment = :credit_card
    elsif params[:order][:method_of_payment] == "1"
      @method_of_payment = :transfer
    end
    if params[:order][:select_address] == '0'
      @order = Order.new(order_params)
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.first_name + current_customer.last_name
    elsif params[:order][:select_address] == '1'
      @order = Order.new(order_params)
    end
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:select_address, :method_of_payment, :postal_code, :address, :address_name)
  end
end
