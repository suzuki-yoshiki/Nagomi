class AddMainMenuToWorkReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :work_reservations, :main_menu, :string
  end
end
