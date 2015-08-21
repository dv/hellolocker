require 'rails_helper'

RSpec.describe Link, type: :model do

  it "has a label" do
    Link.new.label
  end

end
