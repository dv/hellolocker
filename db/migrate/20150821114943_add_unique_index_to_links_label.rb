class AddUniqueIndexToLinksLabel < ActiveRecord::Migration
  def change
    add_index :links, :label, unique: true
  end
end
