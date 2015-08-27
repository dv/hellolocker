require "rails_helper"

RSpec.describe LabelMaker do

  context "#generate_short_label" do
    it "generates a short label" do
      label_maker = LabelMaker.new
      label = label_maker.generate_short_label(salt_count: 5, index: 111)

      expect(label).not_to be_nil
    end

    it "generates different labels with same salt_count and index" do
      label1 = LabelMaker.new.generate_short_label(salt_count: 5, index: 111)
      label2 = LabelMaker.new.generate_short_label(salt_count: 5, index: 111)

      expect(label1).not_to eq(label2)
    end

    it "generates longer label when higher salt_count" do
      label1 = LabelMaker.new.generate_short_label(salt_count: 1, index: 111)
      label2 = LabelMaker.new.generate_short_label(salt_count: 10, index: 111)

      expect(label1.length).to be < label2.length
    end
  end

end
