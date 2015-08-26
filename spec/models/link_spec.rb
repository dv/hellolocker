require 'rails_helper'

RSpec.describe Link, type: :model do
  it "cannot have the same label as another link" do
    label = "abc"
    create :link, label: label

    link = build :link, label: label

    expect(link).to be_invalid
  end

  it "is invalid with an empty label" do
    link = build :link, label: nil

    expect(link).to be_invalid
  end

end
