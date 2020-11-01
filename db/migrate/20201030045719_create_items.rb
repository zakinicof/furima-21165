class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string  :name,               null: false
      t.text    :description,        null: false
      t.integer :price,              null: false
      t.integer :category_id,        null: false, foreign_key: true
      t.integer :item_condition_id,  null: false, foreign_key: true
      t.integer :shipping_payer_id,  null: false, foreign_key: true
      t.integer :prefecture_code_id, null: false
      t.integer :preparation_day_id, null: false, foreign_key: true
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
