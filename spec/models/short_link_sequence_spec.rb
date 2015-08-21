require "rails_helper"

RSpec.describe ShortLinkSequence do

  describe "#next" do
    it "returns a number" do
      num = ShortLinkSequence.next

      expect(num).to be_a(Numeric)
    end

    it "returns strictly rising numbers" do
      num1 = ShortLinkSequence.next
      num2 = ShortLinkSequence.next

      expect(num1).to be < num2
    end
  end
end
