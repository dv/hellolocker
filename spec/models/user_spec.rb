require 'rails_helper'

RSpec.describe User do

  context "master user" do

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

    it "has a valid password" do
      password = "password"
      user = create(:user, password: password)

      expect(user.valid_password?(user.password)).to be_truthy
    end

  end

end
