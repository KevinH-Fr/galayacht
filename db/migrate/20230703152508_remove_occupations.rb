class RemoveOccupations < ActiveRecord::Migration[7.0]
  def up
    drop_table :occupations
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
