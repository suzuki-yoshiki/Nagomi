class AddPriceToWorkReservations < ActiveRecord::Migration[5.2]
  def change
    add_column :work_reservations, :price, :string
  end
end
