class AddUserPreneurs < ActiveRecord::Migration[7.0]
  def change
    add_reference :preneurs, :user, null: true, foreign_key: true
  end
end
