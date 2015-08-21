class Packer
  TWO_CHAR_UPPER_BOUND = 43 # Numbers higher than this require one more character

  class << self
    delegate :pack, :unpack, :generate_single_segment_salt, to: :instance
  end

  def pack(data)
    hashids.encode(data)
  end

  def unpack(data)
    hashids.decode(data)
  end

  def generate_single_segment_salt
    Random.rand(TWO_CHAR_UPPER_BOUND + 1)
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
