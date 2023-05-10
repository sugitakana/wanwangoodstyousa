class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :customer_id, null: false
      t.integer :tag_id, null: false
      t.string :item_name, null: false
      t.integer :item_price, null: false
      t.string :bog_breed, null: false
      t.text :review, null: false
      t.float :rate, null: false
      t.timestamps
    end
  end
end
