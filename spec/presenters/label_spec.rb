require "rails_helper"

RSpec.describe Label do

  describe "#Label" do

    it "creates a Label from a Link" do
      link = create :link

      label = Label(link)

      expect(label).to be_a(Label)
    end

    it "raises an error when not a Link" do
      expect { Label(123) }.to raise_error(ArgumentError)
    end

  end

  describe "#to_param" do
    it "returns the Link's label" do
      label_string = "testing-to-param"
      link = create :link, label: label_string
      label = Label(link)

      expect(label.to_param).to eq(label_string)
    end
  end
end
