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

  scenario "can be created" do
    full_url = "http://example.com/"
    user = create_user_and_login

    visit new_item_path

    fill_in "item_url", with: full_url
    click_on "Create"

    expect(page).to have_content(full_url)
  end

end
