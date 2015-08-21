require 'rails_helper'
require 'label'

RSpec.describe LabelsHelper, type: :helper do
  describe "path_for" do
    it "returns the public facing path of a Link" do
      label_string = "batman"
      link = build :link, label: label_string
      label = Label(link)

      path = polymorphic_url(label, routing_type: :path)

      expect(path).to eq("/#{label_string}")
    end
  end
end
