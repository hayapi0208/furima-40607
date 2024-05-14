class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    @donation_address.save(params,current_user.id)
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :municipalities, :street_address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
