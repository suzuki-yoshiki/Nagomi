class CreatePhoneReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_reservations do |t|
      t.date :worked_on
      t.string :reservation_line_flag
      t.text :reservation_work
      t.string :reservation_mark
      t.string :client_name_flag
      t.integer :user_id

      t.timestamps
    end
  end
end
