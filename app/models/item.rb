class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_tame
  has_one_attaches :image
  belongs_to :user

  validates :item, presence: true
  validates :item_comment, presence: true
  validates :item_category_id, numericality: { other_than: 1 }
  validates :item_condition_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :delivery_tame_id, numericality: { other_than: 1 }
  validates :price, presence: true
  validates :image, presence: true
end
