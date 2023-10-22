class AddAdresseToPreneurs < ActiveRecord::Migration[7.0]
  def change
    add_column :preneurs, :adresse, :string
  end
end
