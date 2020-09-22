class AddContentPriceToWorks < ActiveRecord::Migration[5.2]
  def change
    add_column :works, :content_price, :string
  end
end
