class AddAnswerToReservations < ActiveRecord::Migration[5.2]
  def change
    add_reference :reservations, :answer, foreign_key: true
  end

end
