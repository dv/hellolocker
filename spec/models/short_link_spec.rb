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

    it "is automatically generated" do
      link = create :short_link, label: nil

      expect(link.label).not_to be_blank
    end

    it "is regenerated with same index" do
      link = build :short_link, :with_label, salt_count: 4
      index = link.index

      link.salt_count = 5
      link.generate_label

      expect(link.index).to eq(index)
    end

    it "is generated using number of salts specified in salts_count" do
      salt_count = 5
      link = create :short_link, salt_count: salt_count

      packed_salt_count = Packer.unpack(link.label).count - 1

      expect(packed_salt_count).to eq(salt_count)
    end
  end

  context "with a custom label" do
    let(:index) { 9999 }
    let(:salt_count) { 5 }
    let(:label) { ShortLink.generate_random_label(index, salt_count) }

    subject(:link) { build :short_link, label: label }

    it { expect(link.index).to be(index) }
    it { expect(link.salt_count).to be(salt_count) }
  end
end
