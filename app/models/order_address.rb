class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building, :telephone, :user_id, :item_id

  def save(params, user_id)
    order = Order.create(item_id: params[:item_id].to_i, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building: building, telephone: telephone, order_id: order.id)
  end
end
