require "rails_helper"

RSpec.describe ShortLabelSequence do

  describe "#next" do
    it "returns a number" do
      num = ShortLabelSequence.next

      expect(num).to be_a(Numeric)
    end

    it "returns strictly rising numbers" do
      num1 = ShortLabelSequence.next
      num2 = ShortLabelSequence.next

      expect(num1).to be < num2
    end
  end
end
