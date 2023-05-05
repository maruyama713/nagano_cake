class Public::CartItemsController < ApplicationController
  def index
    @cart_item = cart_item_params[:item_id]
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_user.id
    if @catt_item.save
    redirect_to items_path(@item.id)
    else
      render :show
    end
  end


  private

  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
