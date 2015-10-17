# == Schema Information
#
# Table name: items
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  url        :string
#  user_id    :integer
#

require 'rails_helper'

RSpec.describe Item do

  it { expect(Item.new.links).not_to be_nil }

  describe "#url" do
    it "is invalid without" do
      item = build :item, url: nil

      expect(item).to be_invalid
    end
  end

  describe "#user" do
    it "is invalid without" do
      item = build :item, user: nil

      expect(item).to be_invalid
    end
  end

end
