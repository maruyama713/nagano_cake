class Admin::OrdersController < ApplicationController
  def show
    @customer = Customer.find(params[:id])
  end
end
