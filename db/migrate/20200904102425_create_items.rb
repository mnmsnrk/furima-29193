class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,        null: false
      t.string  :name,               null: false
      t.text    :image_text,              null: false
      t.integer :category_id,        null: false
      t.integer :condition_id,        null: false
      t.integer :postage_id,        null: false
      t.integer :prefecture_id,        null: false
      t.integer :handling_id,        null: false
      t.integer :price,        null: false
    end
  end
end
