require 'rails_helper'

RSpec.feature "Short Links" do

  scenario "redirect to full URL", :js do
    full_url = "http://example.com/"
    label = "nanana"
    short_item = create :item, url: full_url
    short_link = create :link, item: short_item, label: label

    visit "/#{label}"

    expect(current_url).to eq(full_url)
  end

end
