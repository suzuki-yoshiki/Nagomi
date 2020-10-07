class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :kana, :string
    add_column :users, :sex, :string
    add_column :users, :line_id, :string
    add_column :users, :address, :string
    add_column :users, :phone_number, :string
    add_column :users, :admin, :boolean
    add_column :users, :work_id, :integer
    add_column :users, :work_reservation_id, :integer
  end
end
