class ShortLinkSequence

  def self.next
    result = ShortLink.connection.execute("SELECT nextval('short_link_seq')")

    result[0]["nextval"]
  end

end
