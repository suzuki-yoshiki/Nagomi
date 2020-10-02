class RemoveStartTimeFromWorkReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :work_reservations, :start_time, :datetime
  end
end
