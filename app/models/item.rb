class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_tame
  belongs_to :user
  has_one_attached :image

  validates :item, presence: true
  validates :item_comment, presence: true
  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_tame_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :image, presence: true
end
