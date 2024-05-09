class ItemsController < ApplicationController
  def index
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :item_comment, :item_category_id, :item_condition_id, :delivery_charge_id, :prefecture_id, :delivery_tame_id, :price, :image).merge(user_id: current_user.id)
  end
end
