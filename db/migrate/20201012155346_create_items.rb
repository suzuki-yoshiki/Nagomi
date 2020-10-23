class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :profile_image_id
      t.integer :price

      t.timestamps
    end
  end
end
