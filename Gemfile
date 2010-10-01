source 'http://rubygems.org'

gem 'rails', '3.0.0'

if defined? RUBY_ENGINE && RUBY_ENGINE == 'jruby'
  gem 'activerecord-jdbc-adapter'
  gem 'activerecord-jdbcmysql-adapter'
  gem 'activerecord-jdbcsqlite3-adapter'
end

# this is a pure java version of nokogiri to silence ffi warnings and
# such
gem "nokogiri", "~>1.5.0beta"

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'capybara'
  gem "factory_girl_rails"
end

gem "capistrano", :group => :development
