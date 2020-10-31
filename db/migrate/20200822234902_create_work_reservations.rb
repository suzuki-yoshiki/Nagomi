class CreateWorkReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :work_reservations do |t|
      t.date :worked_on
      t.datetime :start_date
      t.datetime :end_date
      t.text :reservation_work
      t.string :reservation_mark
      t.string :client_name_flag
      t.integer :user_id
      t.integer :staff_id
      t.integer :work_id
      t.date :beginning_month

      t.timestamps
    end
  end
end
