require 'capybara'
require 'capybara/dsl'
require_relative '../lib/bbc_site'

RSpec.configure do |config|
  config.formatter = :documentation
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app,:browser => :chrome)
end

Capybara.configure do |config|
  config.default_max_wait_time = 10
  config.ignore_hidden_elements = true
  config.default_driver = :chrome
end
