require "rails_helper"

RSpec.describe "Items" do

  scenario "can be created with a default short label" do
    full_url = "http://example.com/"
    user = create_user_and_login

    visit new_item_path

    fill_in "item[url]", with: full_url
    click_on "Create"

    expect(page).to have_content(full_url)
  end

  scenario "can be created with a custom label" do
    full_url = "http://example.com/"
    label = "nanana"
    user = create_user_and_login

    visit new_item_path

    fill_in "item[url]", with: full_url
    fill_in "link[label]", with: label
    click_on "Create"

    expect(page).to have_content(full_url)
    expect(page).to have_content(label)
  end
end
