class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer  :owner_id
      t.date     :start_date
      t.date     :end_date
      t.string   :title
      t.text     :info

      t.timestamps
    end

    add_foreign_key :reservations, :users, column: :owner_id
    add_index :reservations, :owner_id
  end
end
