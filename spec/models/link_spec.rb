# == Schema Information
#
# Table name: links
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  label      :string
#  item_id    :integer
#  label_type :string
#

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

  describe "#url" do
    it "returns the full URL with label" do
      host = "example.com"
      Rails.application.routes.default_url_options[:host] = host
      label = "boo"

      link = build :link, label: label

      expect(link.url).to eq("http://#{host}/#{label}")
    end
  end

  describe ".build_short_link" do
    it "generates a Link" do
      link = Link.build_short_link

      expect(link).not_to be_nil
      expect(link).to be_valid
      expect(link.label_type).to eq("short")
    end
  end

  describe "#label_type" do
    it "can not be empty" do
      link = build :link, label_type: ""

      expect(link).to be_invalid
    end

    it "needs to be from the list" do
      link = build :link, label_type: "nananana"

      expect(link).to be_invalid
    end

    it "can be custom" do
      link = build :link, label_type: "custom"

      expect(link).to be_valid
    end
  end

end
