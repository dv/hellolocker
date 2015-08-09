module RSpecUtils

  def outside_transaction
    if RSpec.configuration.use_transactional_fixtures || database_cleaner_strategy == :transaction
      raise <<-ERROR.strip_heredoc
        Using this method doesn't work very well if DatabaseCleaner or RSpec uses transactional fixtures.
        Consider setting the DatabaseCleaner strategy to :truncation.
      ERROR
    end

    Thread.new do
      ActiveRecord::Base.connection_pool.with_connection do
        yield
      end
    end.join
  end

end

RSpec.configure do |config|
  config.include RSpecUtils

  config.before(:each) do |example|
    @example = example
  end
end
