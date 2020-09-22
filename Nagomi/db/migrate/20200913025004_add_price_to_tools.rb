class AddPriceToTools < ActiveRecord::Migration[5.2]
  def change
    add_column :tools, :price, :integer
  end
end
