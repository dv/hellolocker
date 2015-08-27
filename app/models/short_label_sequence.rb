class ShortLabelSequence

  def self.next
    result = ActiveRecord::Base.connection.execute("SELECT nextval('short_link_seq')")

    result[0]["nextval"].to_i
  end

end
