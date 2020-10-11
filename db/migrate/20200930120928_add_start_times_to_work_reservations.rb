class AddStartTimesToWorkReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :work_reservations, :start_times, :time
  end
end
