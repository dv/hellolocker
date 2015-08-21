class AddLabelToLinks < ActiveRecord::Migration
  def change
    add_column :links, :label, :string
  end
end
