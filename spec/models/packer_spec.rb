require "rails_helper"

RSpec.describe Packer do

  it "codes and decodes numbers" do
    data = [1,2,3]
    encoded = Packer.pack(data)
    decoded = Packer.unpack(encoded)

    expect(decoded).to eq(data)
  end

end
