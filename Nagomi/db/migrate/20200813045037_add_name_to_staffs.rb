class AddNameToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :name, :string
    add_column :staffs, :kana, :string
    add_column :staffs, :sex, :string
    add_column :staffs, :age, :string
    add_column :staffs, :line_id, :string
    add_column :staffs, :address, :string
    add_column :staffs, :phone_number, :string
    add_column :staffs, :staff_number, :string
  end
end
