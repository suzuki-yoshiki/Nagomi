class CreateWorkHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :work_histories do |t|
      t.date :worked_on
      t.datetime :start_date
      t.datetime :end_date
      t.text :reservation_work
      t.string :reservation_mark
      t.string :client_name_flag
      t.string :main_menu
      t.string :option_menu
      t.time :start_times
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
