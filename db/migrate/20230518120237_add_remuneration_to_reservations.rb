class AddRemunerationToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :remuneration, :integer
  end
end
