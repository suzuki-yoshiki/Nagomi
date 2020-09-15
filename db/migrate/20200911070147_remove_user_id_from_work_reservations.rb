class RemoveUserIdFromWorkReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :work_reservations, :user_id, :integer
  end
end
