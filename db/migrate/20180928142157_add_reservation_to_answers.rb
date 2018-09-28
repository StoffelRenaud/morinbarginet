class AddReservationToAnswers < ActiveRecord::Migration[5.2]
  def change
    add_reference :answers, :reservation, foreign_key: true
  end
end
