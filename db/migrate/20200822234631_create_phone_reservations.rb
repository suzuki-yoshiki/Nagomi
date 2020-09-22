class CreatePhoneReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_reservations do |t|
      t.date :worked_on
      t.string :reservation_line_flag
      t.text :reservation_work
      t.string :reservation_mark
      t.string :client_name_flag
      t.integer :user_id
      t.integer :staff_id
      t.integer :line_time
      t.string :line_time_11
      t.string :line_time_12
      t.string :line_time_13
      t.string :line_time_14
      t.string :line_time_15
      t.string :line_time_16
      t.string :line_time_17
      t.boolean :line_booked, default: false
      t.text :time_work
      t.string :time_line_flag
      t.text :time_work

      t.timestamps
    end
  end
end
