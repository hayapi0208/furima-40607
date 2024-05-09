class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item,               null: false
      t.text       :item_comment,       null: false
      t.integer    :item_category_id,   null: false
      t.integer    :item_condition_id,  null: false
      t.integer    :delivery_charge_id, null: false
      t.integer    :prefecture_id,      null: false
      t.integer    :delivery_tame_id,   null: false
      t.integer    :price,              null: false
      t.references :user,               null: false, foreign_key: true

      t.timestamps
    end
  end
end
