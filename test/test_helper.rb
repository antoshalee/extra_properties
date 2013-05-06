require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  # Configure Rails Environment
  ENV["RAILS_ENV"] = "test"

  require File.expand_path("../dummy/config/environment.rb",  __FILE__)
  require "rails/test_help"

  Rails.backtrace_cleaner.remove_silencers!

  # Load support files
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }
end

Spork.each_run do
  # Load fixtures from the engine
  if ActiveSupport::TestCase.method_defined?(:fixture_path=)
    ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  end

  Dir["#{File.dirname(__FILE__)}/../lib/extra_properties/*.rb"].each do |file|
    load file
  end

end