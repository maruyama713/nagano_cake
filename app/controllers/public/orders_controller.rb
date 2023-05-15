class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirmation

    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @postage = 800
    @total = @cart_items.inject(0){|sum,item| sum + item.subtotal}
    @billing_amount = @total + @postage
    if params[:method_of_payment] == "0"
      @method_of_payment = :credit_card
    elsif params[:method_of_payment] == "1"
      @method_of_payment = :transfer
    end
    if params[:order][:select_address] == '0'
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.address_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:select_address] == '1'
      @order.postal_code = params[:postal_code]
      @order.address = params[:address]
      @order.address_name = params[:address_name]
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
