require 'rails_helper'

RSpec.feature "Master User" do

  scenario "Can sign in" do
    visit root_path
    click_on "Sign in"

    fill_in "Password", with: Rails.application.secrets.master_password
    click_on "Log in"

    expect(page).to have_content("Sign out")
  end

  scenario "Can sign out" do
    single_user_login

    click_link "Sign out"

    expect(page).to have_content("Sign in")
  end

end
