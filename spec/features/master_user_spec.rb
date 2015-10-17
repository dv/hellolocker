require 'rails_helper'

RSpec.feature "Master User" do

  scenario "Can sign in" do
    visit root_path
    click_on t("layouts.navigation.sign_in")

    fill_in "Password", with: Rails.application.secrets.master_password
    click_on "Log in"

    expect(page).to have_content(t("layouts.navigation.sign_out"))
  end

  scenario "Can sign out" do
    single_user_login

    click_link t("layouts.navigation.sign_out")

    expect(page).to have_content(t("layouts.navigation.sign_in"))
  end

end
