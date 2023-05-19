class ChangeTypeFieldToOccupations < ActiveRecord::Migration[7.0]
  def change
    change_column :occupations, :debut, :datetime
    change_column :occupations, :fin, :datetime
  end
end
