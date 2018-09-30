class RemoveTitleFromReservations < ActiveRecord::Migration[5.2]
  def change
    remove_column :reservations, :title, :string
  end
end
