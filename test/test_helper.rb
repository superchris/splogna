ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionMailer::TestCase
  include ActionController::UrlWriter
  default_url_options[:host] = "http://example.com"
end

require "capybara/rails"

module ActionController
  class IntegrationTest
    include Capybara
  end
end
