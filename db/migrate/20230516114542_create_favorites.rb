class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      
      t.references :customer, foreign_key: true
      t.references :review, foreign_key: true
      
      t.timestamps
      t.index [:customer_id, :review_id], unique: true
    end
  end
end
