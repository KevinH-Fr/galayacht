class AddConditionsGeneralesToAdminParameters < ActiveRecord::Migration[7.0]
  def change
    add_column :admin_parameters, :conditions_generales, :text
  end
end
