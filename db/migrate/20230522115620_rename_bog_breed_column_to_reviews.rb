class RenameBogBreedColumnToReviews < ActiveRecord::Migration[6.1]
  def change
     rename_column :reviews, :bog_breed, :dog_breed
  end
end
