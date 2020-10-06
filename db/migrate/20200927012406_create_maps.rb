class CreateMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :maps do |t|
      t.text :address
      t.float :latitude
      t.float :longitude
      t.integer :distance
      t.integer :near_distance
      t.integer :time
      t.integer :near_time
      t.text :title
      t.text :comment

      t.timestamps
    end
  end
end
