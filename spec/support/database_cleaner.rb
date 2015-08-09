module DatabaseCleanerUtils

  attr :database_cleaner_strategy

  def set_database_cleaner_strategy(strategy)
    DatabaseCleaner.strategy = strategy
    @database_cleaner_strategy = strategy
  end

end

# Thank you Avdi - http://devblog.avdi.org/2012/08/31/configuring-database_cleaner-with-rails-rspec-capybara-and-selenium/
RSpec.configure do |config|

  config.include DatabaseCleanerUtils

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    set_database_cleaner_strategy(:transaction)
  end

  config.before(:each, :clean_with_truncation) do
    set_database_cleaner_strategy(:truncation)
  end

  config.before(:each, :js) do
    set_database_cleaner_strategy(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
