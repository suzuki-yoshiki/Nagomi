class AddPriceToWorkHistories < ActiveRecord::Migration[5.2]
  def change
    add_column :work_histories, :price, :string
  end
end
