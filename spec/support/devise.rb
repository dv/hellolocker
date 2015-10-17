module FeatureSessionHelpers
  def create_user_and_login(*options)
    user = create :user, *options

    login_as(user)

    user
  end
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers
  config.include FeatureSessionHelpers, type: :feature
  config.include Devise::TestHelpers, type: :controller

  config.before :suite do
    Warden.test_mode!
  end
end
