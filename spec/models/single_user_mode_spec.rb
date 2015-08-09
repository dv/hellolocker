require 'rails_helper'

RSpec.describe SingleUserMode do

  it "is enabled" do
    expect(SingleUserMode).to be_enabled
  end

  it "has a master user" do
    user = SingleUserMode.master_user

    expect(user).not_to be_nil
    expect(user).to be_master
  end

  it "creates a master user and avoids doubles", :clean_with_truncation do
    our_master_user = create(:user)

    expect(SingleUserMode).to receive(:ensure_only_one_master_or_rollback!)
      .and_wrap_original do |original, their_master_user|

        outside_transaction do
          our_master_user.update_attribute(:master, true)
        end

        original.call(their_master_user)
      end

    returned_master_user = SingleUserMode.master_user
    expect(User.where(master: true).many?).to be_falsy
    expect(returned_master_user).to eq(our_master_user)
  end

end
