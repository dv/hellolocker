class RenameTypeToLabelTypeInLinks < ActiveRecord::Migration
  def change
    rename_column :links, :type, :label_type
  end
end
