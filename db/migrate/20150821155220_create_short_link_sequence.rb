class CreateShortLinkSequence < ActiveRecord::Migration
  def up
    execute <<-SQL
      CREATE SEQUENCE short_link_seq;
    SQL
  end

  def down
    execute <<-SQL
      DROP SEQUENCE short_link_seq;
    SQL
  end
end
