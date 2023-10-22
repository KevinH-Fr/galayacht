class AddReservationToContrats < ActiveRecord::Migration[7.0]
  def change
    add_reference :contrats, :reservation, foreign_key: true, optional: true
  end
end
