# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  master                 :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe User do

  context "master user" do

    it "doesn't require email or password to be created" do
      user = build(:master, password: nil, email: nil)

      expect(user).to be_valid
    end

    it "become master" do
      user = User.new
      user.master = true

      expect(user).to be_master
    end

    it "cannot become master when a master already exists" do
      master = create :master
      user = create :user

      user.master = true
      expect(user).not_to be_valid
      expect(user.save).to be_falsy
    end

    it "has the master password as the only valid password" do
      password = "a-new-password"
      master_password = Rails.application.secrets.master_password

      master = create(:master, password: password)

      expect(master.valid_password?(password)).to be_falsy
      expect(master.valid_password?(master_password)).to be_truthy
    end

  end

  context "normal user" do

    it "requires email and password to be created" do
      user_without_password = build(:user, password: nil)
      user_without_email = build(:user, email: nil)

      expect(user_without_password).not_to be_valid
      expect(user_without_email).not_to be_valid
    end

    it "has the correct password" do
      password = "password"
      user = create(:user, password: password)

      expect(user.valid_password?("not-it")).to be_falsy
      expect(user.valid_password?(Rails.application.secrets.master_password)).to be_falsy
      expect(user.valid_password?(password)).to be_truthy
    end

  end

end
