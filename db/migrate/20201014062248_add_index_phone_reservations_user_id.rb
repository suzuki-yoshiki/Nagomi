class AddIndexPhoneReservationsUserId < ActiveRecord::Migration[5.2]
  def change
    add_index :phone_reservations, :user_id
  end
end
