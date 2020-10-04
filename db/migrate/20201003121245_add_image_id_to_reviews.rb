class AddImageIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :image_id, :string
  end
end
