class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :work_id
      t.integer :cart_id
      t.integer :quantity

      t.timestamps
    end
  end
end
