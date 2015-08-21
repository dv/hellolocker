require "rails_helper"

RSpec.describe ShortLink, type: :model do
  context "#label" do
    it "it is valid when packed data" do
      label = Packer.pack(1)
      link = build :short_link, label: label

      expect(link).to be_valid
    end

    it "is invalid when not packed data" do
      label = "nanana"
      link = build :short_link, label: label

      expect(link).to be_invalid
    end
  end

  context "#index" do
    it "returns the number that is encoded in the label" do

    end
  end
end
