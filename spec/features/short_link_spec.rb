require 'rails_helper'

RSpec.feature "Short links" do

  scenario "can be visited", :js do
    full_url = "http://example.com"
    short_link = create :item, url: full_url

    visit item_path(short_link)

    expect(current_url).to eq(full_url)
  end

end
