class RemoveWorkIdFromCartItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :work_id, :integer
  end
end
