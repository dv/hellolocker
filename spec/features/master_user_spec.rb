require 'rails_helper'

RSpec.describe "as a master user" do

  it "can sign in" do
    visit root_path
    fill_in "Password", with: Rails.application.secrets.master_password
    click_on "Log in"

    expect(page).to have_content("Sign out")
  end

end
