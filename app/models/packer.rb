class Packer

  class << self
    delegate :pack, :unpack, to: :instance
  end

  def pack(data)
    hashids.encode(data)
  end

  def unpack(data)
    hashids.decode(data)
  end

private

  def self.instance
    Packer.new
  end

  def hashids
    Hashids.new(salt)
  end

  def salt
    Rails.application.secrets.hashids_salt
  end

end
