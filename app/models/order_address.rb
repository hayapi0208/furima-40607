class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building, :telephone, :user_id, :item_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipalities
    validates :street_address
    validates :telephone, numericality: { only_integer: true }, length: { in: 10..11 },
                          format: { with: /\A\d+\z/, message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    order = Order.create(user_id:, item_id:)
    Address.create(post_code:, prefecture_id:, municipalities:,
                   street_address:, building:, telephone:, order_id: order.id)
  end
end
