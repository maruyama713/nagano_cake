class Admin::HomesController < ApplicationController
  def top
    @order_items = Order.all
  end
end
