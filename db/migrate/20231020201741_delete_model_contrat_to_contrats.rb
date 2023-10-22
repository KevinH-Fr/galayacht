class DeleteModelContratToContrats < ActiveRecord::Migration[7.0]
  def change
    remove_column :contrats, :model_contrat, :boolean
  end
end
