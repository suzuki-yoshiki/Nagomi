class CreatePhoneReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :phone_reservations do |t|
      t.date :worked_on
      t.string :reservation_line_flag
      t.text :reservation_work
      t.string :client_name_flag
      t.integer :user_id
      t.integer :staff_id
      t.integer :line_time
      t.boolean :reservation_mark, default: false 
      t.boolean :line_end, default: false #LINE電話が完了したか
      t.boolean :holiday, default: false #休みにする
      t.boolean :line_booked, default: false #LINE電話の予約する
      t.text :time_work
      t.string :time_line_flag
      t.text :time_work

      t.timestamps
    end
  end
end
