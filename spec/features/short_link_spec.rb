require 'rails_helper'

RSpec.feature "Short Links" do

  scenario "can be visited", :js do
    full_url = "http://example.com/"
    short_item = create :item, url: full_url
    short_link = create :link, item: short_item

    visit item_path(short_link)

    expect(current_url).to eq(full_url)
  end

end
