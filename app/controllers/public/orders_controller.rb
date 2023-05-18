class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def confirmation
    @order = Order.new(order_params)
    #@order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
    @order.postage = 800
    @order_total = @cart_items.inject(0){|sum,item| sum + item.subtotal}
    @order.billing_amount = @order_total + @order.postage
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
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.address_name = params[:order][:address_name]
    end
  end

  def thanks
    @order = current_customer.orders.new(order_params)
    @order.customer_id = current_customer.id
    if @order.save
      redirect_to '/orders/complete'
    else
      render :new
    end
  end

  def index
    @orders = Order.all
    @cart_items = current_customer.cart_items

  end
  def show
    @order = Order.find(params[:id])
    @cart_items = current_customer.cart_items
    @order_total = @cart_items.inject(0){|sum,item| sum + item.subtotal}
  end

  private
  def order_params
    params.require(:order).permit(:method_of_payment, :postal_code, :address, :address_name, :postage, :billing_amount)
  end
end
