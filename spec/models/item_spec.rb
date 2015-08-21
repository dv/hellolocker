require 'rails_helper'

RSpec.describe Item do

  it { expect(Item.new.links).not_to be_nil }

end
