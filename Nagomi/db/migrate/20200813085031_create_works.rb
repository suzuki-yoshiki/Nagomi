class CreateWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :works do |t|
      t.string :content_name
      t.string :content
      t.string :profile_image_id
      t.integer :reservation_id
      t.integer :user_id

      t.timestamps
    end
  end
end
