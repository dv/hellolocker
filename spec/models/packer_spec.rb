require "rails_helper"

RSpec.describe Packer do

  it "codes and decodes numbers" do
    data = [1,2,3]
    encoded = Packer.pack(data)
    decoded = Packer.unpack(encoded)

    expect(decoded).to eq(data)
  end

  context "#generate_single_segment_salt" do
    it "generates random salts" do
      salt1 = Packer.generate_single_segment_salt
      salt2 = Packer.generate_single_segment_salt

      expect(salt1).not_to eq(salt2)
    end

    it "generates numbers encodable in two characters" do
      salt = Packer.generate_single_segment_salt
      packed = Packer.pack(salt)

      expect(packed.length).to be <= 2
    end
  end

end
