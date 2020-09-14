class AddUserIdToWorkReservations < ActiveRecord::Migration[5.2]
  def change
    add_reference :work_reservations, :user, foreign_key: true
  end
end
