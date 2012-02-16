# This file is specific to the config for the UCCN site so when we upgrade to a newer version
# of Cucumber, the env.rb file does not lose what we have specified here

require 'email_spec'
require 'email_spec/cucumber'
require 'capybara/rails'
require 'capybara/cucumber'
require 'capybara/session'