class CreateTimeReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :time_reservations do |t|
      t.integer :line_time
      t.string :time_line_flag
      t.text :time_work
      t.string :time_mark
      t.string :client_name_flag
      t.integer :user_id
      t.integer :staff_id

      t.timestamps
    end
  end
end
