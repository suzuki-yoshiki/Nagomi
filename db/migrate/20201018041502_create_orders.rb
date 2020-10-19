class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :name
      t.string :address
      t.string :email
      t.string :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
