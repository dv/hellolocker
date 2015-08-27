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
    end
  end

end
