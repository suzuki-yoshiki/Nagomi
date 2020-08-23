class CreatePhoneReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_reservations do |t|
      t.date :worked_on
      t.time :line_time
      t.string :reservation_line_flag
      t.datetime :start_date
      t.datetime :end_date
      t.text :reservation_work
      t.string :reservation_mark
      t.string :client_name_flag
      t.integer :user_id
      t.integer :staff_id

      t.timestamps
    end
  end
end
