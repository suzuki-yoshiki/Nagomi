class AddOptionMenuToWorkReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :work_reservations, :option_menu, :string
  end
end
