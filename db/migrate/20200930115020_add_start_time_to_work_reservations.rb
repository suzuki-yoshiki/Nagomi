class AddStartTimeToWorkReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :work_reservations, :start_time, :datetime
  end
end
