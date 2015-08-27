require 'rails_helper'

RSpec.describe Item do

  it { expect(Item.new.links).not_to be_nil }

  describe "#url" do
    it "is invalid without" do
      item = build :item, url: nil

      expect(item).to be_invalid
    end
  end

end
