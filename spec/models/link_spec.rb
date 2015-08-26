require 'rails_helper'

RSpec.describe Link, type: :model do
  it "cannot have the same label as another link" do
    label = "abc"

    another_link = create :link, label: label
    link = build :link, label: label

    expect(link).to be_invalid
  end

end
