# spec/spec_helper.rb
require 'rack/test'
require 'rspec'
require 'database_cleaner'
require 'byebug'

ENV['RACK_ENV'] = 'test'

require File.expand_path '../../my_app.rb', __FILE__

module RSpecMixin
  include Rack::Test::Methods

  def app()
    @app ||= MyApp.new
  end
end

Struct.new("User", :orders)

class MyApp < Sinatra::Base
  def current_user
    user = Struct::User.new([])
  end
end

# For RSpec 2.x and 3.x
RSpec.configure do |config|
  config.include RSpecMixin

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

end
